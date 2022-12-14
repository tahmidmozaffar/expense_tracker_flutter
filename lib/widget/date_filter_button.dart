import 'package:flutter/material.dart';

import 'period_button.dart';

class DateFilterButton extends StatelessWidget {
  final int selectedPeriod;
  final int dateOffset;
  final String? dateString;
  final Function(int, int) onPressed;

  const DateFilterButton(
      {Key? key,
      required this.selectedPeriod,
      required this.dateOffset,
      required this.dateString,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PeriodButton(
                title: "Daily",
                onPressed: () {
                  onPressed(0, 0);
                },
                isSelected: selectedPeriod == 0,
              ),
              PeriodButton(
                title: "Weekly",
                onPressed: () {
                  onPressed(1, 0);
                },
                isSelected: selectedPeriod == 1,
              ),
              PeriodButton(
                title: "Monthly",
                onPressed: () {
                  onPressed(2, 0);
                },
                isSelected: selectedPeriod == 2,
              ),
              PeriodButton(
                title: "Yearly",
                onPressed: () {
                  onPressed(3, 0);
                },
                isSelected: selectedPeriod == 3,
              ),
            ]),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    onPressed(selectedPeriod, dateOffset + 1);
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.only(left: 10, right: 0, top: 5, bottom: 5),
                    child: Icon(Icons.arrow_back_ios),
                  )),
              Text(dateString!,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold)),
              InkWell(
                onTap: () {
                  onPressed(selectedPeriod,
                      dateOffset > 0 ? dateOffset - 1 : dateOffset);
                },
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 7, right: 3, top: 5, bottom: 5),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
