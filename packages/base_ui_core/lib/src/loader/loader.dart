import 'package:base_ui_core/src/loader/loader_theme.dart';
import 'package:base_ui_core/src/loader/loaders/oval_loader.dart';
import 'package:flutter/material.dart';

enum LoaderVariant {
  bars,
  oval,
  dots,
}

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.variant = LoaderVariant.oval,
    this.color,
    this.size,
  });

  final LoaderVariant variant;
  final Color? color;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    LoaderThemeData styledTheme = LoaderTheme.of(context) // styled
        .colored(color)
        .sized(size);
    return OvalLoader(
      size: styledTheme.size!.width,
      color: styledTheme.color ?? Theme.of(context).primaryColor,
    );
  }
}
