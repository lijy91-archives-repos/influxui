import 'package:flutter/material.dart' show MaterialColor, Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:influxui/src/widgets/extended_theme/extended_colors.dart';

class Switch extends StatefulWidget {
  const Switch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.trackColor,
    this.thumbColor,
  });

  /// Whether this switch is on or off.
  final bool value;

  /// Called when the user toggles with switch on or off.
  ///
  /// The switch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the switch with the new
  /// value.
  ///
  /// If null, the switch will be displayed as disabled, which has a reduced opacity.
  ///
  /// The callback provided to onChanged should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// SwitchSwitch(
  ///   value: _giveVerse,
  ///   onChanged: (bool newValue) {
  ///     setState(() {
  ///       _giveVerse = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool>? onChanged;

  /// The color to use for the track when the switch is on.
  final Color? activeColor;

  /// The color to use for the track when the switch is off.
  final Color? trackColor;

  /// The color to use for the thumb of the switch.
  final Color? thumbColor;

  @override
  State<Switch> createState() => _SwitchState();
}

class _SwitchState extends State<Switch> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Color activeColor = widget.activeColor ?? theme.colorScheme.primary;
    Color trackColor = widget.trackColor ?? ExtendedColors.gray.shade200;
    Color thumbColor = widget.thumbColor ?? ExtendedColors.white;

    if (activeColor is MaterialColor) {
      activeColor = activeColor.shade600;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          widget.onChanged?.call(!widget.value);
        },
        child: Stack(
          children: [
            Container(
              width: 44,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: widget.value ? activeColor : trackColor,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: widget.value ? 22 : 2,
              top: 2,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: thumbColor,
                  boxShadow: [
                    BoxShadow(
                      color: ExtendedColors.black.withOpacity(0.1),
                      offset: const Offset(0, 1),
                      blurRadius: 3,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: ExtendedColors.black.withOpacity(0.1),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: -1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
