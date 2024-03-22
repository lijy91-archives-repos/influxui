import 'package:influxui/influxui.dart';
import 'package:influxui/src/widgets/loader/loaders/oval_loader.dart';

export 'package:influxui/src/widgets/loader/loader_theme.dart';

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
    this.size = ExtendedSize.medium,
  });

  final LoaderVariant variant;
  final Color? color;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final LoaderThemeData? themeData = LoaderTheme.of(context);
    final LoaderThemeData defaults = _LoaderDefaults(context);

    Color resolvedColor =
        color ?? themeData?.color ?? Theme.of(context).primaryColor;
    Size resolvedSize = size ?? themeData?.mediumSize ?? defaults.mediumSize!;

    if (size is ExtendedSize) {
      switch (size) {
        case ExtendedSize.small:
          resolvedSize = themeData?.smallSize ?? defaults.smallSize!;
          break;
        case ExtendedSize.medium:
          resolvedSize = themeData?.mediumSize ?? defaults.mediumSize!;
          break;
        case ExtendedSize.large:
          resolvedSize = themeData?.largeSize ?? defaults.largeSize!;
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
  Size? get tinySize => const Size.square(18);

  @override
  Size? get smallSize => const Size.square(22);

  @override
  Size? get mediumSize => const Size.square(36);

  @override
  Size? get largeSize => const Size.square(44);

  @override
  Size? get bigSize => const Size.square(58);
}
