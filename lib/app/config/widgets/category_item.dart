import 'package:flutter/material.dart';
import 'package:news_finder_task/app/helpers/enums.dart';

class CategoryItem extends StatelessWidget {
  final CategoriesEnum category;
  final CategoriesEnum? selectedCategory;
  final ValueChanged<CategoriesEnum> onChanged;

  const CategoryItem({
    super.key,
    required this.category,
    required this.onChanged,
    this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: InkWell(
        onTap: category == selectedCategory
            ? null
            : () {
                onChanged(category);
              },
        child: Container(
          height: 50,
          constraints: const BoxConstraints(
            minWidth: 100,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: category == selectedCategory ? Colors.lightBlueAccent : null,
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
            child: Text(
              category.name.toUpperCase(),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
