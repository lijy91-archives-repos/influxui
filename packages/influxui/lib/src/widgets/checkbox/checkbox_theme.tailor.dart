// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'checkbox_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$CheckboxThemeDataTailorMixin
    on ThemeExtension<CheckboxThemeData>, DiagnosticableTreeMixin {
  Color? get color;

  @override
  CheckboxThemeData copyWith({
    Color? color,
  }) {
    return CheckboxThemeData(
      color: color ?? this.color,
    );
  }

  @override
  CheckboxThemeData lerp(
      covariant ThemeExtension<CheckboxThemeData>? other, double t) {
    if (other is! CheckboxThemeData) return this as CheckboxThemeData;
    return CheckboxThemeData(
      color: Color.lerp(color, other.color, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckboxThemeData &&
            const DeepCollectionEquality().equals(color, other.color));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(color),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckboxThemeData'))
      ..add(DiagnosticsProperty('color', color));
  }
}

extension CheckboxThemeDataBuildContextProps on BuildContext {
  CheckboxThemeData get checkboxThemeData =>
      Theme.of(this).extension<CheckboxThemeData>()!;
  Color? get color => checkboxThemeData.color;
}
