import 'package:flutter/material.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/utils/app_styles.dart';

class SourceNameTap extends StatelessWidget {
  Source source;
  bool isSelected;
  SourceNameTap({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(source.name ?? '',
    style: isSelected ? Theme.of(context).textTheme.labelLarge
    : Theme.of(context).textTheme.labelMedium);
  }
}
