import 'package:flutter/material.dart';
import 'package:news_app/ui/home/search/search_result_widget.dart';
import 'package:news_app/utils/app_colors.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.055,
            horizontal: width * 0.02),
        child: Column(
          spacing: height * 0.015,
          children: [
            TextField(
              controller: searchController,
              style: Theme.of(context).textTheme.titleMedium,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: Theme.of(context).textTheme.titleMedium,
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                prefixIconColor: Theme.of(context).indicatorColor,
                suffixIcon: IconButton(onPressed: (){
                  searchController.clear();
                  setState(() {

                  });
                },
                    icon: Icon(Icons.clear,size: 30, color: Theme.of(context).indicatorColor,)),
                suffixIconColor: Theme.of(context).indicatorColor,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: Theme.of(context).indicatorColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: Theme.of(context).indicatorColor)),
              ),
              onSubmitted: (_){
                setState(() {

                });
              },
            ),
            Expanded(
              child: searchController.text.isEmpty
                ? Center(
              child: Text(
                'No search query entered.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
                : SearchResultWidget(query: searchController.text),
            ),
          ],
        ),
      ),
    );
  }
}

