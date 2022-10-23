import 'package:flutter/material.dart';
import '../utils.dart';
import '../view/expense_category_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  void onPress(int id) {
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Expense Category"),
              Icon(Icons.add_circle),
            ],
          ),
          SizedBox(
            height: 75,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.from(Utils.getCategories.map((el) =>
                    ExpenseCategoryListItem(
                        id: el.id,
                        iconName: el.iconName,
                        title: el.title,
                        onPress: onPress)))),
          )
        ],
      ),
    );
  }
}
