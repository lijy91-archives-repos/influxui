import 'dart:io';

import 'package:recase/recase.dart';

String _tablerIconsTtfUrl =
    'https://github.com/tabler/tabler-icons/raw/master/packages/icons-webfont/fonts/tabler-icons.ttf';
String _tablerIconsScssUrl =
    'https://github.com/tabler/tabler-icons/raw/master/packages/icons-webfont/tabler-icons.scss';

class IconInfo {
  IconInfo(this.name, this.code);

  final String name;
  final String code;

  String toCode() {
    bool startsWithDigit =
        RegExp(r'^[0-9]').hasMatch(name) || ['switch'].contains(name);
    return '''
  static const IconData ${startsWithDigit ? 'icon_$name' : name} = IconData(
    0x$code,
    fontFamily: iconFont,
    fontPackage: iconFontPackage,
  );
''';
  }
}

Future<void> main(List<String> args) async {
  File tablerIconsTtf = File('fonts/tabler-icons.ttf');
  File tablerIconsScss = File('fonts/tabler-icons.scss');

  if (tablerIconsTtf.existsSync()) tablerIconsTtf.deleteSync();
  if (tablerIconsScss.existsSync()) tablerIconsScss.deleteSync();

  await download(_tablerIconsTtfUrl, tablerIconsTtf);
  await download(_tablerIconsScssUrl, tablerIconsScss);

  String scssContent = tablerIconsScss.readAsStringSync();
  RegExp regex = RegExp(
    r"(\$ti-icon-[a-zA-Z0-9-]+): unicode\('([a-zA-Z0-9]+)'\);",
  );
  Iterable<RegExpMatch> matches = regex.allMatches(scssContent);

  List<IconInfo> iconInfos = [];
  for (RegExpMatch match in matches) {
    String iconName = match.group(1)!.replaceAll('\$ti-icon-', '').snakeCase;
    String code = match.group(2)!;
    iconInfos.add(IconInfo(iconName, code));
  }
  File dartFile = File('lib/src/tabler_icons.dart');
  if (dartFile.existsSync()) dartFile.deleteSync();
  await dartFile.writeAsString('''
import 'package:flutter/widgets.dart';

class TablerIcons {
  static const String iconFont = 'tabler-icons';
  static const String iconFontPackage = 'tabler_icon_library';
${iconInfos.map((e) => e.toCode()).join('\n')}
}
''');
  if (tablerIconsScss.existsSync()) tablerIconsScss.deleteSync();
}

/// Downloads the content from [url] and saves it to [target]
Future download(String url, File target) async {
  print('Downloading $url');
  final request = await HttpClient().getUrl(Uri.parse(url));
  final response = await request.close();
  return response.pipe(target.openWrite());
}
