import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/extended_theme/extended_icons.dart';

class BuildedTheme {}

@immutable
class ExtendedThemeBuilder extends StatelessWidget {
  ExtendedThemeBuilder({
    super.key,
    IconLibrary? iconLibrary,
    required this.builder,
  }) {
    ExtendedIcons.iconLibrary = iconLibrary;
  }

  final ValueWidgetBuilder<BuildedTheme> builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, BuildedTheme(), null);
  }
}
