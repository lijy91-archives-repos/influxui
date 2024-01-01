import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';

class BuildedTheme {}

@immutable
class ExtendedThemeBuilder extends StatelessWidget {
  ExtendedThemeBuilder({
    Key? key,
    IconLibrary? iconLibrary,
    required this.builder,
  }) : super(key: key) {
    Icons.iconLibrary = iconLibrary;
  }

  final ValueWidgetBuilder<BuildedTheme> builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, BuildedTheme(), null);
  }
}
