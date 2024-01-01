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
    final themeData = LoaderTheme.of(context);
    Color resolvedColor =
        color ?? themeData.color ?? ExtendedTheme.of(context).primaryColor!;
    Size resolvedSize = size ?? themeData.mediumSize;

    if (size is NamedSize) {
      switch (size) {
        case NamedSize.tiny:
          resolvedSize = themeData.tinySize;
          break;
        case NamedSize.small:
          resolvedSize = themeData.smallSize;
          break;
        case NamedSize.medium:
          resolvedSize = themeData.mediumSize;
          break;
        case NamedSize.large:
          resolvedSize = themeData.largeSize;
          break;
        case NamedSize.big:
          resolvedSize = themeData.bigSize;
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
