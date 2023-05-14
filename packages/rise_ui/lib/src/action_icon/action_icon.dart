import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/action_icon/action_icon_theme.dart';
import 'package:rise_ui/src/theme/theme.dart';

const _kPressedOpacity = 0.8;

enum ActionIconVariant {
  subtle,
  filled,
  outline,
  light,
  transparent,
  gradient,
}

class ActionIconSize extends Size {
  ActionIconSize(super.width, super.height);
  static NamedSize get tiny => NamedSize.tiny;
  static NamedSize get small => NamedSize.small;
  static NamedSize get medium => NamedSize.medium;
  static NamedSize get large => NamedSize.large;
  static NamedSize get big => NamedSize.big;
}

class ActionIcon extends StatefulWidget {
  const ActionIcon(
    this.icon, {
    super.key,
    this.brightness,
    this.variant,
    this.color,
    this.shape,
    this.size,
    this.onPressed,
  }) : assert(size is Size || size is NamedSize || size == null);

  final IconData icon;
  final Brightness? brightness;
  final ActionIconVariant? variant;
  final Shape? shape;
  final Color? color;
  final Size? size;
  final VoidCallback? onPressed;

  /// Whether the actionicon is enabled or disabled. ActionIcons are disabled by default. To
  /// enable a actionicon, set its [onPressed] property to a non-null value.
  bool get enabled => onPressed != null;

  @override
  State<ActionIcon> createState() => _ActionIconState();
}

class _ActionIconState extends State<ActionIcon>
    with SingleTickerProviderStateMixin {
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
  void didUpdateWidget(ActionIcon old) {
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

  bool _actioniconHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_actioniconHeldDown) {
      _actioniconHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_actioniconHeldDown) {
      _actioniconHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_actioniconHeldDown) {
      _actioniconHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final bool wasHeldDown = _actioniconHeldDown;
    final TickerFuture ticker = _actioniconHeldDown
        ? _animationController.animateTo(1.0,
            duration: kFadeOutDuration, curve: Curves.easeInOutCubicEmphasized)
        : _animationController.animateTo(0.0,
            duration: kFadeInDuration, curve: Curves.easeOutCubic);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _actioniconHeldDown) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ActionIconThemeData styledTheme =
        ActionIconTheme.of(context) // styled
            .brightnessed(widget.brightness ?? Theme.of(context).brightness)
            .varianted(widget.variant)
            .colored(widget.color ?? Theme.of(context).primaryColor)
            .sized(widget.size ?? ActionIconSize.medium)
            .shaped(widget.shape);

    final bool enabled = widget.enabled;

    Color? backgroundColor = styledTheme.color;
    Color? borderColor = styledTheme.color;

    ActionIconVariant variant = widget.variant ?? ActionIconVariant.subtle;
    switch (variant) {
      case ActionIconVariant.transparent:
        backgroundColor = Colors.transparent;
        borderColor = Colors.transparent;
        break;
      default:
        break;
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
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTapCancel: enabled ? _handleTapCancel : null,
        onTap: widget.onPressed,
        child: Semantics(
          button: true,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: styledTheme.size!.width,
              minHeight: styledTheme.size!.height,
              maxWidth: styledTheme.size!.width,
              maxHeight: styledTheme.size!.height,
            ),
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  color: backgroundColor,
                  shape: shapeBorder,
                ),
                child: Center(
                  child: Icon(
                    widget.icon,
                    size: styledTheme.size!.width,
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
