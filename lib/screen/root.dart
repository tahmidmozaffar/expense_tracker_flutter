import 'package:expense_tracker_flutter/screen/categories.dart';
import 'package:expense_tracker_flutter/screen/home.dart';
import 'package:expense_tracker_flutter/screen/scheduled_expense.dart';
import 'package:expense_tracker_flutter/screen/transactions.dart';
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
  int _dateOffset = 0;
  String dateString = getDateString(0, 0);

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const pageViewWidgets = [
    HomeScreen(),
    TransactionScreen(),
    Text(
      'Overview',
      style: optionStyle,
    ),
    Text(
      'Accounts',
      style: optionStyle,
    )
  ];

  static const Map<String, Widget> _widgetOptions = {
    "categories_screen": CategoriesScreen(),
    "scheduled_expense_screen": ScheduledExpenseScreen(),
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
      _controller.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool shouldShowDateFilterButtons =
        _selectedScreen == "home_screen" && _selectedTab != 3;

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
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedScreen = "home_screen";
                    _selectedTab = 0;
                  });
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.category_rounded,
                ),
                title: const Text('Categories'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedScreen = "categories_screen";
                  });
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.timer,
                ),
                title: const Text('Scheduled Expense'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedScreen = "scheduled_expense_screen";
                  });
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            if (shouldShowDateFilterButtons) ...[
              DateFilterButton(
                  selectedPeriod: _selectedPeriod,
                  dateOffset: _dateOffset,
                  dateString: dateString,
                  onPressed: (selectedPeriod, dateOffset) {
                    setState(() {
                      _selectedPeriod = selectedPeriod;
                      _dateOffset = dateOffset;
                      dateString = getDateString(selectedPeriod, dateOffset);
                    });
                  }),
            ],
            if (_selectedScreen != "categories_screen" &&
                _selectedScreen != "scheduled_expense_screen") ...[
              Expanded(
                  child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
                children: pageViewWidgets,
              ))
            ] else ...[
              _widgetOptions[_selectedScreen]!
            ]
          ],
        ),
        bottomNavigationBar: (_selectedScreen != "categories_screen" &&
                _selectedScreen != "scheduled_expense_screen")
            ? BottomNavigationBar(
                backgroundColor: Colors.deepPurple,
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
                onTap: _onItemTapped)
            : null);
  }

  static String getDateString(int selectedPeriod, int dateOffset) {
    switch (selectedPeriod) {
      case 1:
        return "Week $dateOffset";
      case 2:
        return "Month $dateOffset";
      case 3:
        return "Year $dateOffset";
      case 0:
      default:
        return "Day $dateOffset";
    }
  }
}
