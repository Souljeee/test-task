import 'package:flutter/material.dart';

abstract final class AppColors {
  // Backgrounds
  static const Color background = Color(0xFF151820);
  static const Color surface = Color(0xFF1E2230);
  static const Color surfaceElevated = Color(0xFF252A3A);

  // Accent — teal / turquoise
  static const Color accent = Color(0xFF00C9B1);
  static const Color accentDim = Color(0xFF00A896);
  static const Color accentGlow = Color(0x2600C9B1);

  // Text
  static const Color textPrimary = Color(0xFFEEF0F5);
  static const Color textSecondary = Color(0xFF8A90A8);
  static const Color textDisabled = Color(0xFF4A506A);

  // Dividers & borders
  static const Color border = Color(0xFF2A3048);

  // Status
  static const Color success = Color(0xFF00C9B1);
  static const Color error = Color(0xFFFF5C72);
}
