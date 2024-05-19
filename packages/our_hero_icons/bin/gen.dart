// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:icon_font_generator/icon_font_generator.dart';

class IconFont {
  IconFont({
    required this.inputSvgDir,
    required this.outputFontFile,
    required this.outputClassFile,
    required this.className,
    required this.package,
    required this.fontName,
  });

  final String inputSvgDir;
  final String outputFontFile;
  final String outputClassFile;
  final String className;
  final String package;
  final String fontName;

  static IconFont create(int size, String style) {
    String className = 'HeroIcons$size$style';
    if (size == 24) {
      className = 'HeroIcons';
      if (style == 'solid') className = 'HeroIconsSolid';
    }
    return IconFont(
      inputSvgDir: 'heroicons/src/$size/$style',
      outputFontFile: 'fonts/heroicons_${size}_$style.otf',
      outputClassFile: 'lib/src/heroicons_${size}_$style.dart',
      className: className,
      package: 'our_hero_icons',
      fontName: 'heroicons_${size}_$style',
    );
  }
}

Future<void> main(List<String> args) async {
  final Directory heroIconsDir = Directory('heroicons');
  if (heroIconsDir.existsSync()) heroIconsDir.deleteSync(recursive: true);
  Process.runSync(
    'git',
    [
      'clone',
      'https://github.com/tailwindlabs/heroicons.git',
    ],
  );

  final iconFonts = <IconFont>[
    IconFont.create(16, 'solid'),
    IconFont.create(20, 'solid'),
    IconFont.create(24, 'outline'),
    IconFont.create(24, 'solid'),
  ];

  for (var iconFont in iconFonts) {
    final svgFiles = Directory(iconFont.inputSvgDir).listSync();
    final Map<String, String> svgMap = {};
    for (var svgFile in svgFiles) {
      if (svgFile is File) {
        ProcessResult result = Process.runSync(
          'picosvg',
          [svgFile.path],
        );

        final iconName = svgFile.path.split('/').last.split('.').first;
        svgMap[iconName] = result.stdout.toString();
      }
    }
    // Generating font
    final svgToOtfResult = svgToOtf(
      svgMap: svgMap,
      fontName: iconFont.fontName,
    );

    // Writing font to a file
    writeToFile(iconFont.outputFontFile, svgToOtfResult.font);

    // Generating Flutter class
    final generatedClass = generateFlutterClass(
      glyphList: svgToOtfResult.glyphList,
      familyName: svgToOtfResult.font.familyName,
      className: iconFont.className,
      fontFileName: iconFont.outputFontFile,
      package: iconFont.package,
    );

    // Writing class content to a file
    File(iconFont.outputClassFile).writeAsStringSync(generatedClass);
  }
  if (heroIconsDir.existsSync()) heroIconsDir.deleteSync(recursive: true);
}
