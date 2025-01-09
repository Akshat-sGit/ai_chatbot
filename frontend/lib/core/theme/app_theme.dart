import 'package:ai_chatbot/core/theme/app_colors.dart';
import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary, 
    brightness: Brightness.light, 
    scaffoldBackgroundColor: AppColors.lightBackgorund, 
    inputDecorationTheme: InputDecorationTheme(
        filled: true, 
        fillColor: Colors.transparent, 
        hintStyle: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w500, 
          color: const Color(0xff383838)
        ),
        contentPadding: const EdgeInsets.all(30), 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), 
          borderSide: const BorderSide(
            color: Colors.white, 
            width: 0.4, 
          )
        ), 
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, 
        elevation: 0,
        textStyle: GoogleFonts.plusJakartaSans(
          fontSize: 16, 
          fontWeight: FontWeight.bold, 
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      )
    ), 
  ); 

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary, 
    brightness: Brightness.dark, 
    scaffoldBackgroundColor: AppColors.darkBackground, 
    inputDecorationTheme: InputDecorationTheme(
        filled: true, 
        fillColor: Colors.transparent, 
        hintStyle: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w500, 
          color: const Color(0xffa7a7a7)
        ),
        contentPadding: const EdgeInsets.all(30), 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), 
          borderSide: const BorderSide(
            color: Colors.white, 
            width: 0.4, 
          )
        ), 
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, 
        elevation: 0,
        textStyle: GoogleFonts.plusJakartaSans(
          fontSize: 16, 
          fontWeight: FontWeight.bold, 
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      )
    ), 
  ); 

} 