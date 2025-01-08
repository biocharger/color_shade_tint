import 'dart:math';

import 'package:flutter/material.dart';

/// Extension on the [Color] class to provide additional functionality for
/// converting colors to different formats and generating shades and tints.
///
/// Methods:
/// - `_floatToInt8(double x)`: Converts a floating-point value to an 8-bit integer.
/// - `asRed`: Gets the red component of the color as an 8-bit integer.
/// - `asGreen`: Gets the green component of the color as an 8-bit integer.
/// - `asBlue`: Gets the blue component of the color as an 8-bit integer.
/// - `toInt32`: Converts the color to a 32-bit integer representation.
/// - `_tintValue(int value, double factor)`: Calculates the tinted value of a color component.
/// - `_shadeValue(int value, double factor)`: Calculates the shaded value of a color component.
/// - `_tintColor(Color color, double factor)`: Generates a tinted color based on the given factor.
/// - `_shadeColor(Color color, double factor)`: Generates a shaded color based on the given factor.
/// - `toMaterialColor()`: Converts the color to a [MaterialColor] with various shades and tints.
extension ColorEx on Color {
  int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }

  int get asRed => _floatToInt8(r);
  int get asGreen => _floatToInt8(g);
  int get asBlue => _floatToInt8(b);

  /// Converts the color components (alpha, red, green, blue) to a 32-bit integer representation.
  ///
  /// The color components are assumed to be in the range [0.0, 1.0] and are converted to 8-bit integers.
  /// The resulting 32-bit integer has the following format:
  ///
  /// ```
  /// 0xAARRGGBB
  /// ```
  ///
  /// - `a`: Alpha component
  /// - `r`: Red component
  /// - `g`: Green component
  /// - `b`: Blue component
  ///
  /// Returns a 32-bit integer representing the color.
  int get toInt32 {
    return _floatToInt8(a) << 24 | _floatToInt8(r) << 16 | _floatToInt8(g) << 8 | _floatToInt8(b) << 0;
  }

  int _tintValue(int value, double factor) => max(0, min((value + ((255 - value) * factor)).round(), 255)).toInt();
  int _shadeValue(int value, double factor) => max(0, min(value - (value * factor).round(), 255)).toInt();

  Color _tintColor(Color color, double factor) =>
      Color.fromRGBO(_tintValue(asRed, factor), _tintValue(asGreen, factor), _tintValue(asBlue, factor), 1);

  Color _shadeColor(Color color, double factor) =>
      Color.fromRGBO(_shadeValue(asRed, factor), _shadeValue(asGreen, factor), _shadeValue(asBlue, factor), 1);

  /// Converts the current color to a [MaterialColor].
  ///
  /// A [MaterialColor] is a color that has a primary color and
  /// shades and tints of that color. This method generates a
  /// [MaterialColor] with the current color as the primary color
  /// (500) and calculates the tints and shades for the other
  /// color values (50, 100, 200, 300, 400, 600, 700, 800, 900).
  ///
  /// Returns:
  ///   A [MaterialColor] with the current color as the primary
  ///   color and calculated tints and shades.
  MaterialColor toMaterialColor() {
    return MaterialColor(toInt32, {
      50: _tintColor(this, 0.9),
      100: _tintColor(this, 0.8),
      200: _tintColor(this, 0.6),
      300: _tintColor(this, 0.4),
      400: _tintColor(this, 0.2),
      500: this,
      600: _shadeColor(this, 0.1),
      700: _shadeColor(this, 0.2),
      800: _shadeColor(this, 0.3),
      900: _shadeColor(this, 0.4),
    });
  }
}
