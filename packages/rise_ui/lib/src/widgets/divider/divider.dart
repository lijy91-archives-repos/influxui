import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/divider/divider_theme.dart';
import 'package:rise_ui/src/widgets/text/text_theme.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';

export 'package:rise_ui/src/widgets/divider/divider_theme.dart';

/// Controls divider appearance
enum DividerVariant { dashed, dotted, solid }

enum DividerLabelPosition { left, center, right }

class Divider extends StatelessWidget {
  const Divider({
    super.key,
    this.variant,
    this.direction = Axis.horizontal,
    this.color,
    this.size = NamedSize.tiny,
    this.label,
    this.labelBuilder,
    this.labelPosition = DividerLabelPosition.center,
  });

  final DividerVariant? variant;

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
    DividerThemeData styledTheme = DividerTheme.of(context) // styled
        .brightnessed(Theme.of(context).brightness)
        .varianted(variant)
        .sized(size);

    CustomPainter painter;
    switch (variant) {
      case DividerVariant.dashed:
        painter = _DashedLinePainter(
          direction: direction,
          color: color ?? styledTheme.color!,
          width: 1.0,
        );
        break;
      case DividerVariant.dotted:
        painter = _DottedLinePainter(
          direction: direction,
          color: color ?? styledTheme.color!,
          width: 1.0,
        );
        break;
      case DividerVariant.solid:
      default:
        painter = _SolidLinePainter(
          direction: direction,
          color: color ?? styledTheme.color!,
          width: 1.0,
        );
    }

    final TextStyle textStyle = TextTheme.of(context) //
        .textStyle
        .copyWith(
          color: styledTheme.labelColor,
          fontSize: styledTheme.labelFontSize,
        );

    bool showLabel = label != null || labelBuilder != null;
    bool showLineOnLeft =
        showLabel && labelPosition != DividerLabelPosition.left;
    bool showLineOnRight =
        showLabel && labelPosition != DividerLabelPosition.right;

    if (!showLabel) {
      showLineOnLeft = true;
      showLineOnRight = false;
    }

    return Container(
      child: Flex(
        direction: direction,
        children: [
          if (showLineOnLeft)
            Expanded(
              child: Container(
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
                child: labelBuilder != null
                    ? labelBuilder!(context)
                    : Text(label!),
              ),
            ),
          if (showLineOnRight)
            Expanded(
              child: Container(
                height: 1,
                child: CustomPaint(
                  painter: painter,
                ),
              ),
            ),
        ],
      ),
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
      ..addRect(direction == Axis.vertical
          ? Rect.fromLTWH(0, 0, width, size.height)
          : Rect.fromLTWH(0, 0, size.width, width));
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
