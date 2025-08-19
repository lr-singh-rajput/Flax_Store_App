import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Heading Style
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );
  static const TextStyle heading3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle heading4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  // Body Text Style
  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.secondaryTextColor,
    height: 1.5,
  );
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 20,
    color: AppColors.secondaryTextColor,
    //height: 1.5,
  );

  // Button Text Style
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  // Caption Text Style
  static const TextStyle caption = TextStyle(
    fontSize: 14,
    color: AppColors.captionColor,
  );
}