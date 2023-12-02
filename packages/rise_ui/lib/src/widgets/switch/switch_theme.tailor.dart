// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'switch_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$SwitchThemeDataTailorMixin
    on ThemeExtension<SwitchThemeData>, DiagnosticableTreeMixin {
  Color? get color;

  @override
  SwitchThemeData copyWith({
    Color? color,
  }) {
    return SwitchThemeData(
      color: color ?? this.color,
    );
  }

  @override
  SwitchThemeData lerp(
      covariant ThemeExtension<SwitchThemeData>? other, double t) {
    if (other is! SwitchThemeData) return this as SwitchThemeData;
    return SwitchThemeData(
      color: Color.lerp(color, other.color, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SwitchThemeData &&
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
      ..add(DiagnosticsProperty('type', 'SwitchThemeData'))
      ..add(DiagnosticsProperty('color', color));
  }
}

extension SwitchThemeDataBuildContextProps on BuildContext {
  SwitchThemeData get switchThemeData =>
      Theme.of(this).extension<SwitchThemeData>()!;
  Color? get color => switchThemeData.color;
}
