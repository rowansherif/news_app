import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/providers/Theme_provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categoryList = [];
  Function viewAllOnClicked;

  CategoryFragment({required this.viewAllOnClicked});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    categoryList = CategoryModel.categoryList(themeProvider.appTheme == ThemeMode.dark ? true : false);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        spacing: height * 0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: index % 2 == 0
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(categoryList[index].imagePath),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.02, horizontal: width * 0.03),
                        child: ToggleSwitch(
                          customWidths: [width * 0.27, width * 0.11],
                          minHeight: 45,
                          cornerRadius: 20.0,
                          activeBgColors: [
                            [AppColors.greyColor],
                            [Theme.of(context).primaryColor]
                          ],
                          activeFgColor: AppColors.whiteColor,
                          inactiveBgColor: AppColors.greyColor,
                          inactiveFgColor: Colors.grey,
                          initialLabelIndex: 1,
                          totalSwitches: 2,
                          customWidgets: [
                            Text(
                              'View All',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context).indicatorColor,
                              ),
                            )
                          ],
                          radiusStyle: true,
                          onToggle: (index1) {
                            viewAllOnClicked(categoryList[index]);
                            print('switched to: $index');
                          },
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.012,
                  );
                },
                itemCount: categoryList.length),
          )
        ],
      ),
    );
  }
}
