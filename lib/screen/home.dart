import 'package:flutter/material.dart';

import '../model/expense_category.dart';
import '../view/expense_category_listitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  void onPress() {
    print("Clicked on list item");
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
          Container(
            height: 80,
            // width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.from(getCategories.map((el)=> ExpenseCategoryListItem(iconName: el.iconName, title: el.title, onPress: onPress)))
            ),
          )
        ],
      ),
    );
  }

  static List<ExpenseCategory> getCategories = [
    ExpenseCategory("cat_bills.svg", "Bills"),
    ExpenseCategory("cat_car.svg", "Car"),
    ExpenseCategory("cat_clothes.svg", "Clothes"),
    ExpenseCategory("cat_communication.svg", "Communication"),
    ExpenseCategory("cat_eatingout.svg", "Eating out"),
    ExpenseCategory("cat_entertainment.svg", "Entertainment"),
    ExpenseCategory("cat_food.svg", "Food"),
    ExpenseCategory("cat_gift.svg", "Gift"),
    ExpenseCategory("cat_health.svg", "Health"),
    ExpenseCategory("cat_pets.svg", "Pets"),
    ExpenseCategory("cat_sports.svg", "Sports"),
    ExpenseCategory("cat_taxi.svg", "Taxi"),
    ExpenseCategory("cat_toiletry.svg", "Toiletry"),
    ExpenseCategory("cat_transport.svg", "Transport"),
    ExpenseCategory("cat_family.svg", "Family"),
  ];
}
