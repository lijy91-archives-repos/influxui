import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui/src/widgets/loader/loaders/oval_loader.dart';

export 'package:rise_ui/src/widgets/loader/loader_theme.dart';

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
    this.size = NamedSize.medium,
  });

  final LoaderVariant variant;
  final Color? color;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final LoaderThemeData? themeData = LoaderTheme.of(context);
    final LoaderThemeData defaults = _LoaderDefaults(context);

    Color resolvedColor =
        color ?? themeData?.color ?? ExtendedTheme.of(context).primaryColor!;
    Size resolvedSize = size ?? themeData?.mediumSize ?? defaults.mediumSize!;

    if (size is NamedSize) {
      switch (size) {
        case NamedSize.tiny:
          resolvedSize = themeData?.tinySize ?? defaults.tinySize!;
          break;
        case NamedSize.small:
          resolvedSize = themeData?.smallSize ?? defaults.smallSize!;
          break;
        case NamedSize.medium:
          resolvedSize = themeData?.mediumSize ?? defaults.mediumSize!;
          break;
        case NamedSize.large:
          resolvedSize = themeData?.largeSize ?? defaults.largeSize!;
          break;
        case NamedSize.big:
          resolvedSize = themeData?.bigSize ?? defaults.bigSize!;
          break;
      }
    }

    return SizedBox(
      width: resolvedSize.width,
      height: resolvedSize.height,
      child: OvalLoader(
        size: resolvedSize.width,
        color: resolvedColor,
      ),
    );
  }
}

class _LoaderDefaults extends LoaderThemeData {
  _LoaderDefaults(this.context) : super();

  final BuildContext context;

  @override
  Size? get tinySize => Size.square(18);
  @override
  Size? get smallSize => Size.square(22);
  @override
  Size? get mediumSize => Size.square(36);
  @override
  Size? get largeSize => Size.square(44);
  @override
  Size? get bigSize => Size.square(58);
}
