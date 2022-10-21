import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpenseCategoryListItem extends StatelessWidget {
  final String iconName;
  final String title;
  final Function() onPress;
  final bool horizontal;

  const ExpenseCategoryListItem(
      {Key? key,
      required this.iconName,
      required this.title,
      required this.onPress,
      this.horizontal = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = [
      SvgPicture.asset(
        "assets/category_icons/$iconName",
        width: 30,
      ),
      const SizedBox(height: 10),
      Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 10),
      )
    ];

    Widget? container;
    if (horizontal) {
      container = Row(
        children: elements,
      );
    } else {
      container = Column(
        children: elements,
      );
    }

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0x20000000), width: 0.5),
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          boxShadow: const [
            BoxShadow(
                color: Color(0x10000000),
                spreadRadius: 0.5,
                blurRadius: 0.5,
                offset: Offset(1, 1))
          ]),
      width: 60,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.black12,
          onTap: onPress,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: container),
        ),
      ),
    );
  }
}
