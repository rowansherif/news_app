import 'package:flutter/material.dart';
import 'package:news_app/ui/home/drawer/drawer_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/assets_manager.dart';

class HomeDrawer extends StatelessWidget {
  Function goHomeOnClicked;
  HomeDrawer({required this.goHomeOnClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      spacing: height * 0.02,
      children: [
        Container(
          alignment: Alignment.center,
          height: height * 0.2,
          width: double.infinity,
          color: AppColors.whiteColor,
          child: Text('News App',style: AppStyles.bold24Black,)
        ),
        InkWell(
          onTap: (){
            //navigate to home screen
            goHomeOnClicked();
          },
          child: DrawerItem(
              imagePath: AssetsManager.homeIcon, itemName: 'Go To Home'),
        ),
        Divider(
          thickness: 2,
          indent: width * 0.03,
          endIndent: width * 0.05,
        ),
        DrawerItem(
            imagePath: AssetsManager.themeIcon, itemName: 'Theme'),
        InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: height * 0.016, horizontal: width * 0.06),
            margin: EdgeInsets.symmetric(horizontal: width * 0.03),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: AppColors.whiteColor,
                    width: 2
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark',
                  style: AppStyles.medium20White,),
                Icon(Icons.arrow_drop_down,
                  color: AppColors.whiteColor,
                  size: 30,)
              ],
            ),
          ),
        ),
        Divider(
          thickness: 2,
          indent: width * 0.03,
          endIndent: width * 0.05,
        ),
        DrawerItem(
            imagePath: AssetsManager.languageIcon, itemName: 'Language'),
        InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: height * 0.016, horizontal: width * 0.06),
            margin: EdgeInsets.symmetric(horizontal: width * 0.03),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: AppColors.whiteColor,
                    width: 2
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('English',
                  style: AppStyles.medium20White,),
                Icon(Icons.arrow_drop_down,
                  color: AppColors.whiteColor,
                  size: 30,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
