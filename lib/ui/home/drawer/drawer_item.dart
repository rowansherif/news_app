import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class DrawerItem extends StatelessWidget {
  String imagePath;
  String itemName;
  DrawerItem({required this.imagePath, required this.itemName});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: width * 0.02,
        children: [
          ImageIcon(AssetImage(imagePath), size: 24,
          color: AppColors.whiteColor,),
          Text(itemName, style: AppStyles.bold20White,)
        ],
      ),
    );
  }
}
