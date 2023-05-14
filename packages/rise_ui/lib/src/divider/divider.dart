import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/divider/divider_theme.dart';
import 'package:rise_ui/src/text/text_theme.dart';
import 'package:rise_ui/src/theme/theme.dart';

export 'package:rise_ui/src/divider/divider_theme.dart';

/// Controls divider appearance
enum DividerVariant { dashed, dotted, solid }

class Divider extends StatelessWidget {
  const Divider({
    super.key,
    this.variant,
    this.direction = Axis.horizontal,
    this.color,
    this.size,
    this.indent,
    this.endIndent,
    this.label,
    this.labelBuilder,
  });

  final DividerVariant? variant;

  final Axis direction;

  final Color? color;

  final Size? size;

  final double? indent;

  final double? endIndent;

  /// Badge label
  final String? label;

  /// Badge label builder
  final WidgetBuilder? labelBuilder;

  @override
  Widget build(BuildContext context) {
    DividerThemeData styledTheme = DividerTheme.of(context) // styled
        .varianted(variant)
        .sized(size);

    CustomPainter painter;
    switch (variant) {
      case DividerVariant.dashed:
        painter = _DashedLinePainter(
          direction: direction,
          color: color ?? Colors.black,
          width: 1.0,
        );
        break;
      case DividerVariant.dotted:
        painter = _DottedLinePainter(
          direction: direction,
          color: color ?? Colors.black,
          width: 1.0,
        );
        break;
      case DividerVariant.solid:
      default:
        painter = _SolidLinePainter(
          direction: direction,
          color: color ?? Colors.black,
          width: 1.0,
        );
    }

    final TextStyle textStyle = TextTheme.of(context).textStyle.copyWith(
          color: styledTheme.labelColor,
          fontSize: styledTheme.labelFontSize,
        );

    return Container(
      child: Flex(
        direction: direction,
        children: [
          if (indent != null) SizedBox(width: indent),
          Expanded(
            child: Container(
              height: 1,
              child: CustomPaint(
                painter: painter,
              ),
            ),
          ),
          if (label != null || labelBuilder != null)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: DefaultTextStyle(
                style: textStyle,
                child: labelBuilder != null
                    ? labelBuilder!(context)
                    : Text(label!),
              ),
            ),
          if (label != null || labelBuilder != null)
            Expanded(
              child: Container(
                height: 1,
                child: CustomPaint(
                  painter: painter,
                ),
              ),
            ),
          if (endIndent != null) SizedBox(width: endIndent),
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
