import 'package:flutter/material.dart';
import 'package:news_finder_task/app/config/widgets/category_item.dart';
import 'package:news_finder_task/app/helpers/enums.dart';

class CategoriesListWidget extends StatelessWidget {
  final CategoriesEnum? selected;
  final ValueChanged<CategoriesEnum> onChanged;

  const CategoriesListWidget({
    super.key,
    this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) => CategoryItem(
        category: CategoriesEnum.values[index],
        onChanged: onChanged,
        selectedCategory: selected,
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemCount: CategoriesEnum.values.length,
    );
  }
}
