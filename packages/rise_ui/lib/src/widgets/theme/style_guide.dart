import 'dart:ui';

import 'package:rise_ui/src/widgets/theme/theme.dart';

class _FontSizes with SizedCustomizable<double> {
  @override
  double sized(Size? size) {
    return sizedCustomizer.of(size)!;
  }

  @override
  Customizer<Size, double> get sizedCustomizer {
    return Customizer<Size, double>({
      NamedSize.tiny: 12,
      NamedSize.small: 14,
      NamedSize.medium: 16,
      NamedSize.large: 18,
      NamedSize.big: 20,
    });
  }
}

class _Radius with SizedCustomizable<double> {
  @override
  double sized(Size? size) {
    return sizedCustomizer.of(size)!;
  }

  @override
  Customizer<Size, double> get sizedCustomizer {
    return Customizer<Size, double>({
      NamedSize.tiny: 2,
      NamedSize.small: 4,
      NamedSize.medium: 8,
      NamedSize.large: 16,
      NamedSize.big: 32,
    });
  }
}

class _Spacing with SizedCustomizable<double> {
  @override
  double sized(Size? size) {
    return sizedCustomizer.of(size)!;
  }

  @override
  Customizer<Size, double> get sizedCustomizer {
    return Customizer<Size, double>({
      NamedSize.tiny: 10,
      NamedSize.small: 12,
      NamedSize.medium: 16,
      NamedSize.large: 20,
      NamedSize.big: 24,
    });
  }
}

class StyleGuide {
  final fontSizes = _FontSizes();
  final radius = _Radius();
  final spacing = _Spacing();
}

final styleGuide = StyleGuide();
