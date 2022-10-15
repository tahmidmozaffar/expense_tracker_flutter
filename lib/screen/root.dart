import 'package:expense_tracker_flutter/screen/categories.dart';
import 'package:expense_tracker_flutter/screen/home.dart';
import 'package:expense_tracker_flutter/screen/scheduled_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/widget/date_filter_button.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RootState();
}

class _RootState extends State<RootScreen> {
  int _selectedTab = 0;
  String _selectedScreen = "home_screen";
  int _selectedPeriod = 0;
  String dateString = getDateString(0);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const Map<String, Widget> _widgetOptions = {
    "home_screen": HomeScreen(),
    "categories_screen": CategoriesScreen(),
    "scheduled_expense_screen": ScheduledExpenseScreen(),
    "transaction_screen": Text(
      'Transcation',
      style: optionStyle,
    ),
    "overview_screen": Text(
      'Overview',
      style: optionStyle,
    ),
    "accounts_screen": Text(
      'Accounts',
      style: optionStyle,
    ),
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
      switch(index){
        case 0:
          _selectedScreen = "home_screen";
          break;
        case 1:
          _selectedScreen = "transaction_screen";
          break;
        case 2:
          _selectedScreen = "overview_screen";
          break;
        case 3:
          _selectedScreen = "accounts_screen";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text('Categories'),
                onTap: () {
                  Navigator.pop(context);
                  setState((){
                    _selectedScreen = "categories_screen";
                  });
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.train,
                ),
                title: const Text('Scheduled Expense'),
                onTap: () {
                  Navigator.pop(context);
                  setState((){
                    _selectedScreen = "scheduled_expense_screen";
                  });
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            if (_selectedScreen != "accounts_screen") ...[
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
            _widgetOptions[_selectedScreen]!
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
