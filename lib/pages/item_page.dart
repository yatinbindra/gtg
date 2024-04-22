import 'package:flutter/material.dart';
import 'package:gtg/pages/verified.dart';

class Item_page extends StatefulWidget {
  const Item_page({super.key});

  @override
  State<Item_page> createState() => _MyWidgetState();
}

int _selectedIndex = 0;

class _MyWidgetState extends State<Item_page> {
  @override
  Widget build(BuildContext context) {
    const List<Widget> _pages = <Widget>[
      Icon(
        Icons.home,
        size: 150,
      ),
      Icon(
        Icons.search,
        size: 150,
      ),
      Icon(
        Icons.pin_drop,
        size: 150,
      ),
      Icon(
        Icons.feed,
        size: 150,
      ),
      Icon(
        Icons.account_circle,
        size: 150,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Verified()),
              );
            },
            child: Image.asset(
              'assets/bell.png',
              width: 23,
              height: 25,
            ),
          ),
          SizedBox(width: 10),
          Image.asset(
            'assets/gtg1.png',
            width: 54,
            height: 54,
          ), //IconButton
        ],
        backgroundColor: Colors.white, //<Widget>[]
        elevation: 50.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        selectedIconTheme: IconThemeData(
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
        currentIndex: _selectedIndex, //New
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
