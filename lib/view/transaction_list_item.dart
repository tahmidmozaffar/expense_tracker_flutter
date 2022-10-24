import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionListItem extends StatelessWidget {
  final double amount;
  final String currency;
  final String expenseCategory;
  final String categoryIcon;
  final String note;
  final String account;
  final String accountIcon;

  const TransactionListItem(
      {Key? key,
      required this.amount,
      required this.currency,
      required this.expenseCategory,
      required this.categoryIcon,
      required this.note,
      required this.account,
      required this.accountIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          splashColor: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/category_icons/cat_bills.svg",
                        width: 35,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("\$ 72.22",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          Text("Car",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal)),
                          Text("Car insurance",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal))
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/category_icons/cat_bills.svg",
                          width: 12,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "Cash",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
