import 'package:flutter/material.dart';

class PeriodButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isSelected;

  const PeriodButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 0.5,
        ),
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            width: double.infinity,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                width: double.infinity,
                height: 30,
                color: Colors.deepPurpleAccent,
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Visibility(
                visible: isSelected,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        width: double.infinity,
                        height: 5,
                        color: Colors.deepPurple)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
