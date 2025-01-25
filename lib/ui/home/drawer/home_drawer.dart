import 'package:flutter/material.dart';
import 'package:news_app/providers/Theme_provider.dart';
import 'package:news_app/ui/home/drawer/custom_dropdown_menu.dart';
import 'package:news_app/ui/home/drawer/drawer_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/assets_manager.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  Function goHomeOnClicked;
  HomeDrawer({required this.goHomeOnClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<ThemeProvider>(context);
    List <String> themesList = ['Light', 'Dark'];
    String selectedTheme = 'Light';
    List <String> languagesList = ['English', 'Arabic'];
    String selectedLanguage = 'English';
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
        CustomDropdownMenu(
            selectedItem: selectedTheme,
            itemsList: themesList,
            dropDownMenuOnChange: (item){
              if(item == 'Dark'){
                themeProvider.changeTheme(ThemeMode.dark);
              }else{
                themeProvider.changeTheme(ThemeMode.light);}
            }),
        Divider(
          thickness: 2,
          indent: width * 0.03,
          endIndent: width * 0.05,
        ),
        DrawerItem(
            imagePath: AssetsManager.languageIcon, itemName: 'Language'),
        CustomDropdownMenu(
            selectedItem: selectedLanguage,
            itemsList: languagesList,
            dropDownMenuOnChange: (){})
      ],
    );
  }
}
