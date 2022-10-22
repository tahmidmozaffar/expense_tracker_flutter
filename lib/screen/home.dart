import 'package:flutter/material.dart';

import '../model/expense_category.dart';
import '../view/expense_category_listitem.dart';

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
                children: List.from(getCategories.map((el) =>
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

  static List<ExpenseCategory> getCategories = [
    ExpenseCategory(1, "cat_bills.svg", "Bills"),
    ExpenseCategory(2, "cat_car.svg", "Car"),
    ExpenseCategory(3, "cat_clothes.svg", "Clothes"),
    ExpenseCategory(4, "cat_communication.svg", "Communication"),
    ExpenseCategory(5, "cat_eatingout.svg", "Eating out"),
    ExpenseCategory(6, "cat_entertainment.svg", "Entertainment"),
    ExpenseCategory(7, "cat_food.svg", "Food"),
    ExpenseCategory(8, "cat_gift.svg", "Gift"),
    ExpenseCategory(9, "cat_health.svg", "Health"),
    ExpenseCategory(10, "cat_pets.svg", "Pets"),
    ExpenseCategory(11, "cat_sports.svg", "Sports"),
    ExpenseCategory(12, "cat_taxi.svg", "Taxi"),
    ExpenseCategory(13, "cat_toiletry.svg", "Toiletry"),
    ExpenseCategory(14, "cat_transport.svg", "Transport"),
    ExpenseCategory(15, "cat_family.svg", "Family"),
  ];
}
