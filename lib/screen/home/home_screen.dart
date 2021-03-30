import 'package:eld_pinpoint_driver/screen/dashboard/dashboard_screen.dart';
import 'package:eld_pinpoint_driver/screen/log_book/log_book_screen.dart';
import 'package:eld_pinpoint_driver/screen/trip_history/trip_history_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int selectedItem;
  static const routeName = '/home';

  HomeScreen({this.selectedItem});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItem = 0;
  final widgetOptions = [
    DashboardScreen(),
    LogBookScreen(),
    TripHistoryScreen(),
    WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Text('Profile'),
        ),
      ),
    )
  ];

  @override
  void initState() {
    _selectedItem =
        widget.selectedItem == null ? _selectedItem : widget.selectedItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedItem,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (value) {
          setState(() => _selectedItem = value);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Log Book',
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: 'Trip History',
            icon: Icon(Icons.history),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedItem),
      ),
    );
  }
}
