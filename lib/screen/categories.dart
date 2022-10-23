import 'package:flutter/material.dart';

import '../utils.dart';
import '../view/expense_category_list_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key,
  }) : super(key: key);

  void onPress(int id) {
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          padding: const EdgeInsets.all(8),
          children: List.from(Utils.getCategories.map((el) =>
              ExpenseCategoryListItem(
                  horizontal: true,
                  id: el.id,
                  iconName: el.iconName,
                  title: el.title,
                  onPress: onPress)))),
    );
  }
}
