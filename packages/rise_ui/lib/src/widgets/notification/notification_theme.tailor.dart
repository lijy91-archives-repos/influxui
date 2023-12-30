// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'notification_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$NotificationThemeDataTailorMixin
    on ThemeExtension<NotificationThemeData>, DiagnosticableTreeMixin {
  BorderRadius? get borderRadius;

  @override
  NotificationThemeData copyWith({
    BorderRadius? borderRadius,
  }) {
    return NotificationThemeData(
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  NotificationThemeData lerp(
      covariant ThemeExtension<NotificationThemeData>? other, double t) {
    if (other is! NotificationThemeData) return this as NotificationThemeData;
    return NotificationThemeData(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationThemeData &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationThemeData'))
      ..add(DiagnosticsProperty('borderRadius', borderRadius));
  }
}

extension NotificationThemeDataBuildContextProps on BuildContext {
  NotificationThemeData get notificationThemeData =>
      Theme.of(this).extension<NotificationThemeData>()!;
  BorderRadius? get borderRadius => notificationThemeData.borderRadius;
}
