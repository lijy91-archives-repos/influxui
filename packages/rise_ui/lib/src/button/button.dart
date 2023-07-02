// import 'package:rise_ui/src/button/button_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/button/button_theme.dart';
import 'package:rise_ui/src/text/text_theme.dart';
import 'package:rise_ui/src/theme/theme.dart';

export 'package:rise_ui/src/button/button_theme.dart';

const EdgeInsets _kButtonPadding = EdgeInsets.all(16.0);
const _kPressedOpacity = 0.8;

/// Controls button appearance
enum ButtonVariant {
  filled,
  outline,
  light,
  white,
  subtle,
  gradient,
}

class ButtonSize extends Size {
  ButtonSize(super.width, super.height);
  static NamedSize get tiny => NamedSize.tiny;
  static NamedSize get small => NamedSize.small;
  static NamedSize get medium => NamedSize.medium;
  static NamedSize get large => NamedSize.large;
  static NamedSize get big => NamedSize.big;
}

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.brightness,
    this.variant = ButtonVariant.filled,
    this.label,
    this.labelBuilder,
    this.padding,
    this.color,
    this.shape,
    this.size,
    this.compact = false,
    this.uppercase = false,
    this.onPressed,
  }) : assert(size is Size || size is NamedSize || size == null);

  final Brightness? brightness;
  final ButtonVariant? variant;
  final Shape? shape;
  final String? label;
  final WidgetBuilder? labelBuilder;

  /// The amount of space to surround the child inside the bounds of the button.
  ///
  /// Defaults to 16.0 pixels.
  final EdgeInsetsGeometry? padding;

  final Color? color;
  final Size? size;
  final bool compact;
  final bool uppercase;
  final VoidCallback? onPressed;

  /// Whether the button is enabled or disabled. Buttons are disabled by default. To
  /// enable a button, set its [onPressed] property to a non-null value.
  bool get enabled => onPressed != null;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  // Eyeballed values. Feel free to tweak.
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);
    _setTween();
  }

  @override
  void didUpdateWidget(Button old) {
    super.didUpdateWidget(old);
    _setTween();
  }

  void _setTween() {
    _opacityTween.end = _kPressedOpacity;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _animationController.animateTo(1.0,
            duration: kFadeOutDuration, curve: Curves.easeInOutCubicEmphasized)
        : _animationController.animateTo(0.0,
            duration: kFadeInDuration, curve: Curves.easeOutCubic);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonThemeData styledTheme = ButtonTheme.of(context) // styled
        .brightnessed(widget.brightness ?? Theme.of(context).brightness)
        .varianted(widget.variant)
        .colored(widget.color ?? Theme.of(context).primaryColor)
        .sized(widget.size)
        .shaped(widget.shape);

    final bool enabled = widget.enabled;

    Color? backgroundColor = styledTheme.color;
    Color? hoveredBackgroundColor = styledTheme.color;
    Color? borderColor = styledTheme.color;
    Color? labelColor = styledTheme.labelColor;

    if (backgroundColor is ShadedColor) {
      if (styledTheme.colorShade != null) {
        backgroundColor = backgroundColor[styledTheme.colorShade!];
      }
    }

    if (hoveredBackgroundColor is ShadedColor) {
      if (styledTheme.colorShade != null) {
        hoveredBackgroundColor = hoveredBackgroundColor[100];
      } else {
        hoveredBackgroundColor = hoveredBackgroundColor[700];
      }
    }

    if (borderColor is ShadedColor) {
      if (widget.variant != ButtonVariant.outline) {
        borderColor = null;
      }
    }

    if (labelColor is ShadedColor) {
      if (styledTheme.labelColorShade != null) {
        labelColor = labelColor[styledTheme.labelColorShade!];
      }
    }

    ShapeBorder? shapeBorder = RoundedRectangleBorder(
      side: BorderSide(
        color: borderColor ?? Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(
        styledTheme.cornerRadius ?? 0,
      ),
    );

    if (widget.shape == Shape.circle) {
      shapeBorder = CircleBorder(
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
        ),
      );
    }

    return MouseRegion(
      cursor: enabled && kIsWeb ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (PointerEnterEvent event) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (PointerExitEvent event) {
        setState(() {
          _isHovering = false;
        });
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTapCancel: enabled ? _handleTapCancel : null,
        onTap: widget.onPressed,
        child: Semantics(
          button: true,
          child: ConstrainedBox(
            // constraints: widget.minSize == null
            //     ? const BoxConstraints()
            //     : BoxConstraints(
            //         minWidth: widget.minSize!,
            //         minHeight: widget.minSize!,
            //       ),
            constraints: const BoxConstraints(),
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  color: _isHovering ? hoveredBackgroundColor : backgroundColor,
                  shape: shapeBorder,
                ),
                child: Padding(
                  padding: widget.padding ?? _kButtonPadding,
                  child: Align(
                    alignment: Alignment.center,
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: DefaultTextStyle(
                      style: TextTheme.of(context).textStyle.copyWith(
                            color: styledTheme.labelColor,
                            fontSize: styledTheme.labelFontSize,
                            overflow: TextOverflow.ellipsis,
                          ),
                      child: widget.labelBuilder?.call(context) ??
                          Text(widget.label!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}