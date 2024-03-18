import 'package:flutter/material.dart' hide DividerTheme, DividerThemeData;
import 'package:influxui/src/widgets/divider/divider_style.dart';
import 'package:influxui/src/widgets/divider/divider_theme.dart';
import 'package:influxui/src/widgets/extended_theme/extended_theme.dart';

export 'package:influxui/src/widgets/divider/divider_theme.dart';

/// Controls divider appearance
enum DividerVariant { dashed, dotted, solid }

enum DividerLabelPosition { left, center, right }

class Divider extends StatelessWidget {
  const Divider({
    super.key,
    this.variant,
    this.style,
    this.direction = Axis.horizontal,
    this.color,
    this.size = ExtendedSize.small,
    this.label,
    this.labelBuilder,
    this.labelPosition = DividerLabelPosition.center,
  });

  final DividerVariant? variant;

  final DividerStyle? style;

  final Axis direction;

  final Color? color;

  final Size? size;

  /// Badge label
  final String? label;

  /// Badge label builder
  final WidgetBuilder? labelBuilder;

  final DividerLabelPosition? labelPosition;

  @override
  Widget build(BuildContext context) {
    final DividerThemeData? themeData = DividerTheme.of(context);
    final DividerThemeData defaults = _DividerDefaults(context);

    DividerStyle mergedStyle =
        style ?? themeData?.mediumStyle ?? defaults.mediumStyle!;

    if (size is ExtendedSize) {
      switch (size) {
        case ExtendedSize.small:
          mergedStyle = mergedStyle
              .merge(themeData?.smallStyle)
              .merge(defaults.smallStyle!);
          break;
        case ExtendedSize.medium:
          mergedStyle = mergedStyle
              .merge(themeData?.mediumStyle)
              .merge(defaults.mediumStyle!);
          break;
        case ExtendedSize.large:
          mergedStyle = mergedStyle
              .merge(themeData?.largeStyle)
              .merge(defaults.largeStyle!);
          break;
      }
    }

    CustomPainter painter;
    switch (variant) {
      case DividerVariant.dashed:
        painter = _DashedLinePainter(
          direction: direction,
          color: color ?? themeData?.color ?? defaults.color!,
          width: 1.0,
        );
        break;
      case DividerVariant.dotted:
        painter = _DottedLinePainter(
          direction: direction,
          color: color ?? themeData?.color ?? defaults.color!,
          width: 1.0,
        );
        break;
      case DividerVariant.solid:
      default:
        painter = _SolidLinePainter(
          direction: direction,
          color: color ?? themeData?.color ?? defaults.color!,
          width: 1.0,
        );
    }

    final TextStyle textStyle = mergedStyle.labelStyle!;

    bool showLabel = label != null || labelBuilder != null;
    bool showLineOnLeft =
        showLabel && labelPosition != DividerLabelPosition.left;
    bool showLineOnRight =
        showLabel && labelPosition != DividerLabelPosition.right;

    if (!showLabel) {
      showLineOnLeft = true;
      showLineOnRight = false;
    }

    return Flex(
      direction: direction,
      children: [
        if (showLineOnLeft)
          Expanded(
            child: SizedBox(
              height: 1,
              child: CustomPaint(
                painter: painter,
              ),
            ),
          ),
        if (showLabel)
          Container(
            margin: EdgeInsets.only(
              left: labelPosition == DividerLabelPosition.left ? 0 : 10,
              right: labelPosition == DividerLabelPosition.right ? 0 : 10,
            ),
            child: DefaultTextStyle(
              style: textStyle,
              child:
                  labelBuilder != null ? labelBuilder!(context) : Text(label!),
            ),
          ),
        if (showLineOnRight)
          Expanded(
            child: SizedBox(
              height: 1,
              child: CustomPaint(
                painter: painter,
              ),
            ),
          ),
      ],
    );
  }
}

class _SolidLinePainter extends CustomPainter {
  _SolidLinePainter({
    required this.direction,
    required this.width,
    required this.color,
  });

  final Axis direction;
  final double width;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..addRect(
        direction == Axis.vertical
            ? Rect.fromLTWH(0, 0, width, size.height)
            : Rect.fromLTWH(0, 0, size.width, width),
      );
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({
    required this.direction,
    required this.width,
    required this.color,
  });

  final Axis direction;
  final double width;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    final rectangleWidth = width * 2;
    final rectangleSpace = width;

    if (direction == Axis.vertical) {
      double startY = 0;
      while (startY < size.height) {
        path.addRect(Rect.fromLTWH(0, startY, width, rectangleWidth));
        startY += rectangleWidth + rectangleSpace;
      }
    } else {
      double startX = 0;
      while (startX < size.width) {
        path.addRect(Rect.fromLTWH(startX, 0, rectangleWidth, width));
        startX += rectangleWidth + rectangleSpace;
      }
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _DottedLinePainter extends CustomPainter {
  _DottedLinePainter({
    required this.direction,
    required this.width,
    required this.color,
  });

  final Axis direction;
  final double width;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    final rectangleWidth = width;
    final rectangleSpace = width;

    if (direction == Axis.vertical) {
      double startY = 0;
      while (startY < size.height) {
        path.addOval(Rect.fromLTWH(0, startY, width, rectangleWidth));
        startY += rectangleWidth + rectangleSpace;
      }
    } else {
      double startX = 0;
      while (startX < size.width) {
        path.addOval(Rect.fromLTWH(startX, 0, rectangleWidth, width));
        startX += rectangleWidth + rectangleSpace;
      }
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _DividerDefaults extends DividerThemeData {
  _DividerDefaults(this.context) : super();

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);

  @override
  get color => _theme.dividerColor;

  @override
  get smallStyle {
    return const DividerStyle(
      padding: EdgeInsets.symmetric(horizontal: 8),
      minimumSize: Size.square(22),
      iconSize: 16,
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  get mediumStyle {
    return const DividerStyle(
      padding: EdgeInsets.symmetric(horizontal: 10),
      minimumSize: Size.square(28),
      iconSize: 20,
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  get largeStyle {
    return const DividerStyle(
      padding: EdgeInsets.symmetric(horizontal: 12),
      minimumSize: Size.square(34),
      iconSize: 24,
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
