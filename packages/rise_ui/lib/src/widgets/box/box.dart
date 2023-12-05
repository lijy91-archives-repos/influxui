import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/foundation/customizable_property.dart';
import 'package:rise_ui/src/widgets/box/box_state.dart';
import 'package:rise_ui/src/widgets/box/box_style.dart';
import 'package:rise_ui/src/widgets/box/box_theme.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';

export 'package:rise_ui/src/widgets/box/box_state.dart';
export 'package:rise_ui/src/widgets/box/box_style.dart';
export 'package:rise_ui/src/widgets/box/box_theme.dart';
export 'package:rise_ui/src/widgets/box/box_theme_defaults.dart';

enum BoxVariant {
  filled,
  light,
  outline,
  subtle,
  transparent,
  white;

  static BoxVariant? valueOf(String? name) {
    return BoxVariant.values.firstWhereOrNull(
      (variant) => variant.name == name,
    );
  }
}

typedef BoxWidgetBuilder = Widget Function(
  BuildContext context,
  Color foregroundColor,
);

class Box extends StatefulWidget {
  const Box({
    super.key,
    this.variant,
    this.style,
    this.padding,
    this.color,
    this.borderRadius,
    this.pressedOpacity,
    this.mouseCursor,
    this.disabled = false,
    this.onPressed,
    required this.builder,
  });

  final BoxVariant? variant;
  final BoxStyle? style;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadius? borderRadius;
  final double? pressedOpacity;
  final MouseCursor? mouseCursor;
  final bool disabled;
  final VoidCallback? onPressed;
  final BoxWidgetBuilder builder;

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> with SingleTickerProviderStateMixin {
  // Eyeballed values. Feel free to tweak.
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);

  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  bool _isHovered = false;
  bool _isPressed = false;

  bool get enabled => !widget.disabled;

  Set<BoxState> get states {
    final states = <BoxState>{};
    if (widget.disabled) states.add(BoxState.disabled);
    if (_isHovered) states.add(BoxState.hovered);
    if (_isPressed) states.add(BoxState.pressed);
    if (states.isEmpty) states.add(BoxState.normal);
    return states;
  }

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
  void didUpdateWidget(Box oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setTween();
  }

  void _setTween() {
    _opacityTween.end = widget.pressedOpacity ?? 1.0;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails event) {
    if (!_isPressed) {
      _isPressed = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_isPressed) {
      _isPressed = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_isPressed) {
      _isPressed = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final bool wasHeldDown = _isPressed;
    final TickerFuture ticker = _isPressed
        ? _animationController.animateTo(1.0,
            duration: kFadeOutDuration, curve: Curves.easeInOutCubicEmphasized)
        : _animationController.animateTo(0.0,
            duration: kFadeInDuration, curve: Curves.easeOutCubic);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _isPressed) {
        _animate();
      }
    });
  }

  Color? _resolveColor(
    CustomizableProperty<Color, Set<BoxState>>? colorProperty, [
    Color? defaultColor,
  ]) {
    if (colorProperty is BoxStateColor &&
        colorProperty.color == null &&
        defaultColor != null) {
      return colorProperty.copyWith(color: defaultColor).resolve(states);
    }
    return colorProperty?.resolve(states);
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    BoxThemeData themeData = BoxTheme.of(context);
    BoxStyle mergedStyle = widget.style ?? BoxStyle();
    switch (widget.variant) {
      case BoxVariant.filled:
        mergedStyle = mergedStyle.merge(themeData.filledStyle);
      case BoxVariant.light:
        mergedStyle = mergedStyle.merge(themeData.lightStyle);
      case BoxVariant.outline:
        mergedStyle = mergedStyle.merge(themeData.outlineStyle);
      case BoxVariant.subtle:
        mergedStyle = mergedStyle.merge(themeData.subtleStyle);
      case BoxVariant.transparent:
        mergedStyle = mergedStyle.merge(themeData.transparentStyle);
      case BoxVariant.white:
        mergedStyle = mergedStyle.merge(themeData.whiteStyle);
      default:
    }

    final backgroundColor = _resolveColor(
      mergedStyle.color,
      widget.color ?? primaryColor,
    );
    final foregroundColor = _resolveColor(
      mergedStyle.foregroundColor,
      widget.color ?? primaryColor,
    );
    final borderColor = _resolveColor(
      mergedStyle.borderColor,
      widget.color ?? primaryColor,
    );

    return MouseRegion(
      onEnter: (event) {
        if (_isHovered) return;
        setState(() => _isHovered = true);
      },
      onExit: (event) {
        if (!_isHovered) return;
        setState(() => _isHovered = false);
      },
      onHover: (event) {
        if (_isHovered) return;
        setState(() => _isHovered = true);
      },
      cursor: widget.mouseCursor ?? MouseCursor.defer,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTapCancel: enabled ? _handleTapCancel : null,
        onTap: widget.onPressed,
        child: Semantics(
          button: true,
          child: ConstrainedBox(
            constraints: const BoxConstraints(),
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: widget.borderRadius,
                  border: Border.all(
                    color: borderColor ?? Colors.transparent,
                  ),
                  color: backgroundColor,
                ),
                child: Padding(
                  padding: widget.padding ?? EdgeInsets.zero,
                  child: widget.builder(context, foregroundColor!),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
