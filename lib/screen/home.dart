import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
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
            color: Colors.deepPurpleAccent,
            height: 40,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
              Text("One"),
            ],),
          )
        ],
      ),
    );
  }
}
