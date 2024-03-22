import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart' show Colors, Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:influxui/src/foundation/customizable_property.dart';
import 'package:influxui/src/widgets/button/button_base_state.dart';
import 'package:influxui/src/widgets/button/button_base_style.dart';
import 'package:influxui/src/widgets/button/button_base_theme.dart';

export 'package:influxui/src/widgets/button/button_base_state.dart';
export 'package:influxui/src/widgets/button/button_base_style.dart';
export 'package:influxui/src/widgets/button/button_base_theme.dart';

enum ButtonBaseVariant {
  filled,
  light,
  outline,
  subtle,
  transparent,
  white;

  static ButtonBaseVariant? valueOf(String? name) {
    return ButtonBaseVariant.values.firstWhereOrNull(
      (variant) => variant.name == name,
    );
  }
}

typedef ButtonBaseWidgetBuilder = Widget Function(
  BuildContext context,
  Color foregroundColor,
);

class ButtonBase extends StatefulWidget {
  const ButtonBase({
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

  final ButtonBaseVariant? variant;
  final ButtonBaseStyle? style;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadius? borderRadius;
  final double? pressedOpacity;
  final MouseCursor? mouseCursor;
  final bool disabled;
  final VoidCallback? onPressed;
  final ButtonBaseWidgetBuilder builder;

  @override
  State<ButtonBase> createState() => _ButtonBaseState();
}

class _ButtonBaseState extends State<ButtonBase>
    with SingleTickerProviderStateMixin {
  // Eyeballed values. Feel free to tweak.
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);

  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  bool _isHovered = false;
  bool _isPressed = false;

  bool get enabled => !widget.disabled;

  Set<ButtonBaseState> get states {
    final states = <ButtonBaseState>{};
    if (widget.disabled) states.add(ButtonBaseState.disabled);
    if (_isHovered) states.add(ButtonBaseState.hovered);
    if (_isPressed) states.add(ButtonBaseState.pressed);
    if (states.isEmpty) states.add(ButtonBaseState.normal);
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
  void didUpdateWidget(ButtonBase oldWidget) {
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
        ? _animationController.animateTo(
            1.0,
            duration: kFadeOutDuration,
            curve: Curves.easeInOutCubicEmphasized,
          )
        : _animationController.animateTo(
            0.0,
            duration: kFadeInDuration,
            curve: Curves.easeOutCubic,
          );
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _isPressed) {
        _animate();
      }
    });
  }

  Color? _resolveColor(
    CustomizableProperty<Color, Set<ButtonBaseState>>? colorProperty, [
    Color? defaultColor,
  ]) {
    if (colorProperty is ButtonBaseStateColor &&
        colorProperty.color == null &&
        defaultColor != null) {
      return colorProperty.copyWith(color: defaultColor).resolve(states);
    }
    return colorProperty?.resolve(states);
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    final ButtonBaseThemeData? themeData = ButtonBaseTheme.of(context);
    final ButtonBaseThemeData defaults = _ButtonBaseDefaults(context);

    ButtonBaseStyle mergedStyle = widget.style ?? const ButtonBaseStyle();
    switch (widget.variant) {
      case ButtonBaseVariant.filled:
        mergedStyle = mergedStyle // merge filled style
            .merge(themeData?.filledStyle)
            .merge(defaults.filledStyle);
      case ButtonBaseVariant.light:
        mergedStyle = mergedStyle // merge light style
            .merge(themeData?.lightStyle)
            .merge(defaults.lightStyle);
      case ButtonBaseVariant.outline:
        mergedStyle = mergedStyle // merge outline style
            .merge(themeData?.outlineStyle)
            .merge(defaults.outlineStyle);
      case ButtonBaseVariant.subtle: // merge subtle style
        mergedStyle = mergedStyle
            .merge(themeData?.subtleStyle)
            .merge(defaults.subtleStyle);
      case ButtonBaseVariant.transparent:
        mergedStyle = mergedStyle // merge transparent style
            .merge(themeData?.transparentStyle)
            .merge(defaults.transparentStyle);
      case ButtonBaseVariant.white:
        mergedStyle = mergedStyle // merge white style
            .merge(themeData?.whiteStyle)
            .merge(defaults.whiteStyle);
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

class _ButtonBaseDefaults extends ButtonBaseThemeData {
  _ButtonBaseDefaults(this.context) : super();

  final BuildContext context;

  late final ThemeData _theme = Theme.of(context);
  late final bool _isDark = _theme.brightness == Brightness.dark;

  @override
  ButtonBaseStyle? get filledStyle {
    return const ButtonBaseStyle(
      color: ButtonBaseStateColor(
        colorShade: 600,
        hoveredColorShade: 700,
        pressedColorShade: 700,
      ),
      foregroundColor: ButtonBaseStateColor(
        color: Colors.white,
      ),
    );
  }

  @override
  ButtonBaseStyle? get lightStyle {
    if (_isDark) {
      return const ButtonBaseStyle(
        color: ButtonBaseStateColor(
          colorOpacity: 0.15,
          hoveredColorOpacity: 0.2,
          pressedColorOpacity: 0.2,
        ),
        foregroundColor: ButtonBaseStateColor(),
      );
    }
    return const ButtonBaseStyle(
      color: ButtonBaseStateColor(
        colorShade: 50,
        hoveredColorShade: 100,
        pressedColorShade: 100,
      ),
      foregroundColor: ButtonBaseStateColor(),
    );
  }

  @override
  ButtonBaseStyle? get outlineStyle {
    if (_isDark) {
      return const ButtonBaseStyle(
        color: ButtonBaseStateColor(
          colorShade: -1,
          hoveredColorOpacity: 0.2,
          pressedColorOpacity: 0.2,
        ),
        foregroundColor: ButtonBaseStateColor(),
        borderColor: ButtonBaseStateColor(
          colorShade: 600,
        ),
      );
    }
    return const ButtonBaseStyle(
      color: ButtonBaseStateColor(
        colorShade: -1,
        hoveredColorShade: 50,
        pressedColorShade: 50,
      ),
      foregroundColor: ButtonBaseStateColor(),
      borderColor: ButtonBaseStateColor(
        colorShade: 600,
      ),
    );
  }

  @override
  ButtonBaseStyle? get subtleStyle {
    if (_isDark) {
      return const ButtonBaseStyle(
        color: ButtonBaseStateColor(
          colorShade: -1,
          hoveredColorOpacity: 0.2,
          pressedColorOpacity: 0.2,
        ),
        foregroundColor: ButtonBaseStateColor(),
      );
    }
    return const ButtonBaseStyle(
      color: ButtonBaseStateColor(
        colorShade: -1,
        hoveredColorShade: 50,
        pressedColorShade: 50,
      ),
      foregroundColor: ButtonBaseStateColor(),
    );
  }

  @override
  ButtonBaseStyle? get transparentStyle {
    return const ButtonBaseStyle(
      color: ButtonBaseStateColor(
        color: Colors.transparent,
      ),
      foregroundColor: ButtonBaseStateColor(),
    );
  }

  @override
  ButtonBaseStyle? get whiteStyle {
    return const ButtonBaseStyle(
      color: ButtonBaseStateColor(
        color: Colors.white,
        hoveredColorShade: 100,
      ),
      foregroundColor: ButtonBaseStateColor(),
    );
  }
}
