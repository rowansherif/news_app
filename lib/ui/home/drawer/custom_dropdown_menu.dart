import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../providers/Theme_provider.dart';

class CustomDropdownMenu extends StatefulWidget {
  List<String> itemsList;
  String selectedItem;
  Function dropDownMenuOnChange;

  CustomDropdownMenu({required this.selectedItem, required this.itemsList,
    required this.dropDownMenuOnChange
  });
  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<ThemeProvider>(context);

    return DropdownButtonFormField<String>(
        dropdownColor: AppColors.blackColor,
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        iconSize: 30,
        iconEnabledColor: AppColors.whiteColor,
        isExpanded: false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(width: 2, color: AppColors.whiteColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(width: 2, color: AppColors.whiteColor)),
        ),
        value: widget.selectedItem,
        items: widget.itemsList
            .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: AppStyles.medium20White,
                )))
            .toList(),
        onChanged: (item){
          widget.selectedItem = item ?? '';
          widget.dropDownMenuOnChange(item);
        }
    );
  }
}
