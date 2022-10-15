import 'package:expense_tracker_flutter/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/widget/date_filter_button.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RootState();
}

class _RootState extends State<RootScreen> {
  int _selectedTab = 0;
  int _selectedPeriod = 0;
  String dateString = getDateString(0);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Business',
      style: optionStyle,
    ),
    Text(
      'School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            if (_selectedTab <= 2) ...[
              DateFilterButton(
                  selectedPeriod: _selectedPeriod,
                  dateString: dateString,
                  onPressed: (val) {
                    setState(() {
                      _selectedPeriod = val;
                      dateString = getDateString(val);
                    });
                  }),
            ],
            _widgetOptions.elementAt(_selectedTab),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.note),
                label: 'Transaction',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grade),
                label: 'Overview',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                label: 'Accounts',
              ),
            ],
            currentIndex: _selectedTab,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.amber[900],
            onTap: _onItemTapped));
  }

  static String getDateString(int selectedPeriod) {
    switch (selectedPeriod) {
      case 1:
        return "Today's Date 1";
      case 2:
        return "Today's Date 2";
      case 3:
        return "Today's Date 3";
      case 10:
        return "Previous Date";
      case 20:
        return "Next Date";
      case 0:
      default:
        return "Today's Date 0";
    }
  }
}
