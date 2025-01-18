import 'package:news_app/utils/assets_manager.dart';

class CategoryModel {
  String id;
  String imagePath;
  String title;

  CategoryModel(
      {required this.id, required this.imagePath, required this.title});


  static List<CategoryModel> categoryList(bool isDark) {
    return [
      CategoryModel(
          id: 'general',
          imagePath: isDark
              ? AssetsManager.generalDarkModeImage
              : AssetsManager.generalLightModeImage,
          title: 'General'),
      CategoryModel(
          id: 'business',
          imagePath: isDark
              ? AssetsManager.businessDarkModeImage
              : AssetsManager.businessLightModeImage,
          title: 'Business'),
      CategoryModel(
          id: 'entertainment',
          imagePath: isDark
              ? AssetsManager.entertainmentDarkModeImage
              : AssetsManager.entertainmentLightModeImage,
          title: 'Entertainment'),
      CategoryModel(
          id: 'health',
          imagePath: isDark
              ? AssetsManager.healthDarkModeImage
              : AssetsManager.healthLightModeImage,
          title: 'Health'),
      CategoryModel(
          id: 'science',
          imagePath: isDark
              ? AssetsManager.scienceDarkModeImage
              : AssetsManager.scienceLightModeImage,
          title: 'Science'),
      CategoryModel(
          id: 'technology',
          imagePath: isDark
              ? AssetsManager.technologyDarkModeImage
              : AssetsManager.technologyLightModeImage,
          title: 'Technology'),
      CategoryModel(
          id: 'sports',
          imagePath: isDark
              ? AssetsManager.sportsDarkModeImage
              : AssetsManager.sportsLightModeImage,
          title: 'Sports'),
    ];
  }
}
