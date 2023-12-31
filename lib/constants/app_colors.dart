import 'dart:ui';

class AppColors {
  static const Color primaryColor = Color(0xFFfec887);
  static const Color secondaryColor = Color(0xFFffffff);
  static const Color white = Color(0xFFffffff);
  static const Color accentColor = Color(0xFFfcdd92);
  static const Color textColor = Color(0xFF333333);
  static const Color backgroundColor = Color(0xFFf6f2eb);
  // Add more colors as needed

  // Function to convert hex to color
  static Color hexToColor(String hexCode) {
    return Color(int.parse(hexCode.substring(1, 7), radix: 16) + 0xFF000000);
  }
}