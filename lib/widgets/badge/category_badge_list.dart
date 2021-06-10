import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_kit/widgets/badge/category_badge.dart';

class CategoryBadgeList extends StatefulWidget {
  final List<CategoryBadge>? models;
  final Function(CategoryBadge? selectedBadge)? onChange;
  CategoryBadgeList({this.models, this.onChange});

  @override
  CategoryBadgeListState createState() {
    return new CategoryBadgeListState();
  }
}

class CategoryBadgeListState extends State<CategoryBadgeList> {

  CategoryBadge? selectedModel;
  CategoryBadgeListState();

  @override
  Widget build(BuildContext context) {
    final badges = widget.models!.map((model) {
      final isSelected = model.name == selectedModel?.name;
      void onTap (String? name) {
        setState(() {
          final previousSelectedName = selectedModel?.name;
          selectedModel = widget.models!.firstWhereOrNull((element) => element.name == name);
          if (selectedModel?.name != previousSelectedName) {
            widget.onChange?.call(selectedModel);
          }
        });
        model.onTap?.call(name);
      }

      final badge = CategoryBadge(
        text: model.text,
        tagText: model.tagText,
        selected: isSelected,
        name: model.name,
        onTap: onTap,
      );
      return Container(
        margin: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
        child: badge,
      );
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: badges,
      ),
    );
  }
}