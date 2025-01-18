import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      indicatorColor: AppColors.blackColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      primaryColor: AppColors.whiteColor,
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(
            color: AppColors.blackColor,
            size: 24
        ),
        backgroundColor: AppColors.whiteColor,
        titleTextStyle: AppStyles.medium20Black,
        actionsIconTheme: IconThemeData(color: AppColors.blackColor, size: 30),
        centerTitle: true,
      ),
      textTheme: TextTheme(
        labelLarge: AppStyles.bold16Black,
        labelMedium: AppStyles.medium14Black,
        headlineMedium: AppStyles.medium24Black,
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: AppColors.blackColor,
      ));
  static ThemeData darkTheme = ThemeData(
      indicatorColor: AppColors.whiteColor,
      scaffoldBackgroundColor: AppColors.blackColor,
      primaryColor: AppColors.blackColor,
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.whiteColor,
          size: 24
        ),
        backgroundColor: AppColors.blackColor,
        titleTextStyle: AppStyles.medium20White,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: AppColors.whiteColor, size: 30),
      ),
      textTheme: TextTheme(
        labelLarge: AppStyles.bold16White,
        labelMedium: AppStyles.medium14White,
        headlineMedium: AppStyles.medium24White,
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: AppColors.whiteColor,
      ),
  );
}
