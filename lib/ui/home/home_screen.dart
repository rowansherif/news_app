import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/ui/home/drawer/home_drawer.dart';
import 'package:news_app/ui/home/search/search_screen.dart';
import 'package:news_app/utils/app_colors.dart';
import 'category/category_details.dart';
import 'category/category_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory?.title ?? 'Home'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, SearchScreen.routeName);
              }, icon: Icon(Icons.search,
          size: 30,)),
          SizedBox(width: width * 0.03,)
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(
          goHomeOnClicked: goHomeOnClicked,
        ),
      ),
      body: selectedCategory == null ? CategoryFragment(
        viewAllOnClicked: viewAllOnClicked,
      )
      : CategoryDetails(category: selectedCategory!,),
    );
  }

  CategoryModel? selectedCategory;

  void viewAllOnClicked(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }

  void goHomeOnClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }

}
