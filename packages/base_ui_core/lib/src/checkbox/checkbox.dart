import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum CheckboxLabelPosition {
  left,
  right,
}

class CheckboxIcon extends StatelessWidget {
  const CheckboxIcon({
    super.key,
    required this.indeterminate,
  });
  final bool indeterminate;

  @override
  Widget build(BuildContext context) {
    if (indeterminate) {
      return SvgPicture.string('''
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 32 6">
  <rect width="32" height="6" fill="currentColor" rx="3" />
</svg>
''');
    }
    return SvgPicture.string('''
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 7">
  <path
    d="M4 4.586L1.707 2.293A1 1 0 1 0 .293 3.707l3 3a.997.997 0 0 0 1.414 0l5-5A1 1 0 1 0 8.293.293L4 4.586z"
    fill="currentColor"
    fillRule="evenodd"
    clipRule="evenodd"
  />
</svg>
''');
  }
}

class Checkbox extends StatelessWidget {
  const Checkbox({
    super.key,
    this.value,
    this.tristate = false,
    this.onChanged,
    this.label,
    this.labelPosition = CheckboxLabelPosition.left,
    this.labelBuilder,
  });

  /// Whether this checkbox is checked.
  ///
  /// When [tristate] is true, a value of null corresponds to the mixed state.
  /// When [tristate] is false, this value must not be null.
  final bool? value;

  /// If true the checkbox's [value] can be true, false, or null.
  ///
  /// [Checkbox] displays a dash when its value is null.
  ///
  /// When a tri-state checkbox ([tristate] is true) is tapped, its [onChanged]
  /// callback will be applied to true if the current value is false, to null if
  /// value is true, and to false if value is null (i.e. it cycles through false
  /// => true => null => false when tapped).
  ///
  /// If tristate is false (the default), [value] must not be null.
  final bool tristate;

  /// Called when the value of the checkbox should change.
  ///
  /// The checkbox passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the checkbox with the new
  /// value.
  ///
  /// If this callback is null, the checkbox will be displayed as disabled
  /// and will not respond to input gestures.
  ///
  /// When the checkbox is tapped, if [tristate] is false (the default) then
  /// the [onChanged] callback will be applied to `!value`. If [tristate] is
  /// true this callback cycle from false to true to null.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// Checkbox(
  ///   value: _throwShotAway,
  ///   onChanged: (bool? newValue) {
  ///     setState(() {
  ///       _throwShotAway = newValue!;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool?>? onChanged;

  /// Checkbox label
  final String? label;

  /// Position of the label
  final CheckboxLabelPosition labelPosition;
  final Widget? labelBuilder;

  Widget _buildLabel(BuildContext context) {
    return Text(label!);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CheckboxIcon(indeterminate: value == null),
        _buildLabel(context),
      ],
    );
  }
}
