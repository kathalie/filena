import 'dart:math';

import '../../../../core/const/const.dart';

typedef _RGB = ({int r, int g, int b});

class ColorGenerator {
  static int generateContrastingRandomColor() {
    const contrastingDifference = 50;
    const int targetColor = Const.primaryLightColorHex;
    final double targetLuminance = _getLuminance(_toRgb(targetColor));

    int generatedColor = _generateRandomColor(targetLuminance);

    while(_getColorDifference(_toRgb(generatedColor), _toRgb(targetColor)) < contrastingDifference) {
      generatedColor = _generateRandomColor(targetLuminance);
    }

    return generatedColor;
  }

  static double _getColorDifference(_RGB color1, _RGB color2) {
    return
    sqrt(pow(color2.r - color1.r, 2) + pow(color2.g - color1.g, 2) +
        pow(color2.b - color1.b, 2),);
  }

  static double _getLuminance(_RGB color) {
    return (color.r * 0.299 + color.g * 0.587 + color.b * 0.114) / 255;
  }

  static int _generateRandomColor(double targetLuminance) {
    final _RGB randomColor = _generateRandomRgb();
    final generatedLuminance = _getLuminance(randomColor);
    final double factor = targetLuminance / generatedLuminance;

    final _RGB adjustedColor = (
    r: _getAdjustedRgbValue(randomColor.r, factor),
    g: _getAdjustedRgbValue(randomColor.g, factor),
    b: _getAdjustedRgbValue(randomColor.b, factor),
    );

    return _toHex(adjustedColor);
  }

  static _RGB _generateRandomRgb() =>
      (
      r: Random().nextInt(256),
      g: Random().nextInt(256),
      b: Random().nextInt(256),
      );

  static int _getAdjustedRgbValue(int rgbValue, double factor) {
    return (rgbValue * factor).round().clamp(0, 255);
  }

  static int _toHex(_RGB color) {
    return 0xFF000000 | (color.r << 16) | (color.g << 8) | color.b;
  }

  static _RGB _toRgb(int hex) =>
      (
      r: (hex >> 16) & 0xFF,
      g: (hex >> 8) & 0xFF,
      b: hex & 0xFF,
      );
}
