import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {

  const CategoriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight!,
      // height: double.infinity,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}
