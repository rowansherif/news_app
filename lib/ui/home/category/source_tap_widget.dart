import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/ui/home/category/cubit/category_details_view_model.dart';
import 'package:news_app/ui/home/category/cubit/sources_states.dart';
import 'package:news_app/ui/home/category/source_name_tap.dart';
import 'package:news_app/ui/home/news/cubit/news_states.dart';
import 'package:news_app/ui/home/news/news_widget.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTapWidget extends StatefulWidget {
  List<Source> sourcesList;

  SourceTapWidget({required this.sourcesList});

  @override
  State<SourceTapWidget> createState() => _SourceTapWidgetState();
}

class _SourceTapWidgetState extends State<SourceTapWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {

                });
              },
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: AppColors.transparentColor,
              tabs: widget.sourcesList.map((source) {
                return SourceNameTap(
                    source: source,
                    isSelected: selectedIndex ==
                        widget.sourcesList.indexOf(source));
              }).toList()),

          Expanded(
              child: NewsWidget(source: widget.sourcesList[selectedIndex]))
        ],
      ),
    );
  }
}
