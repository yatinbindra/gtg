import 'package:flutter/material.dart';
import 'account.dart';
import 'item_page.dart';
import 'location.dart';
import 'notification.dart';
import 'search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/item': (context) => Item_page(),
        '/search': (context) => SearchPage(),
        '/location': (context) => LocationPage(),
        '/notification': (context) => NotificationPage(color: Colors.pink),
        '/account': (context) => AccountPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Item_page(),
    SearchPage(),
    LocationPage(),
    NotificationPage(color: Colors.pink),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.red,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'pinDrop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'account',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
