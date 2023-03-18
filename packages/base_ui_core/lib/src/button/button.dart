import 'package:base_ui_core/src/box/box.dart';
import 'package:base_ui_core/src/button/button_theme.dart';
import 'package:base_ui_core/src/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

export 'package:base_ui_core/src/button/button_theme.dart';

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
    this.variant,
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

  final ButtonVariant? variant;
  final String? label;
  final WidgetBuilder? labelBuilder;

  /// The amount of space to surround the child inside the bounds of the button.
  ///
  /// Defaults to 16.0 pixels.
  final EdgeInsetsGeometry? padding;

  final Color? color;
  final Shape? shape;
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
    final bool enabled = widget.enabled;
    final ThemeData themeData = Theme.of(context);
    final Color primaryColor = themeData.primaryColor;
    final Color backgroundColor = widget.color ?? primaryColor;
    final theme = ButtonTheme.sizedOf(context);
    // Size? size = theme.sizes?[widget.size];

    // final TextStyle textStyle =
    //     themeData.textTheme.textStyle.copyWith(color: foregroundColor);

    final WidgetBuilder labelBuilder = widget.labelBuilder ??
        (context) {
          return Text(widget.label!);
        };

    return MouseRegion(
      cursor: enabled && kIsWeb ? SystemMouseCursors.click : MouseCursor.defer,
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
                decoration: BoxDecoration(
                  // borderRadius: widget.borderRadius,
                  // color: backgroundColor != null && !enabled
                  //     ? CupertinoDynamicColor.resolve(
                  //         widget.disabledColor, context)
                  //     : backgroundColor,
                  color: backgroundColor,
                ),
                child: Padding(
                  padding: widget.padding ?? _kButtonPadding,
                  child: Align(
                    // alignment: widget.alignment,
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: labelBuilder.call(context),
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
