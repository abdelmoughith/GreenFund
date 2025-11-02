import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  // Style des TextFields
  static InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: AppColors.primaryGreen,
        fontWeight: FontWeight.w500,
      ),
      filled: true,
      fillColor: AppColors.background,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.lightGreen, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.lightGreen, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryGreen, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.errorRed, width: 2),
      ),
    );
  }

  // Style des boutons principaux
  static ButtonStyle greenButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryGreen,
    foregroundColor: AppColors.textLight,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );

  // Style des cartes de projet
  static CardTheme projectCardTheme = CardTheme(
    color: AppColors.background,
    elevation: 3,
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  // Style du texte des titres
  static TextStyle titleText = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  // Style du texte secondaire
  static TextStyle subtitleText = const TextStyle(
    fontSize: 14,
    color: AppColors.textDark,
  );
}
