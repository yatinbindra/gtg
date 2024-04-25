import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'account.dart';
import 'location.dart';
import 'news.dart';
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
        '/search': (context) => const SearchPage(),
        '/location': (context) => const LocationPage(),
        '/notification': (context) => const NewsPage(),
        '/account': (context) => const AccountPage(),
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
    HomePage(),
    const SearchPage(),
    const LocationPage(),
    const NewsPage(),
    const AccountPage(),
  ];

  late bool isSwitched; // Initialize switch state
  bool isPushEnabled = false;
  final String _pushEnabledKey = 'push_enabled';
  @override
  void initState() {
    super.initState();
    _loadSwitchState(); // Load switch state when widget initializes
  }

  Future<void> _loadSwitchState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Retrieve switch state, default to false if not found
      isSwitched = prefs.getBool('switchState') ?? false;
      isPushEnabled = prefs.getBool(_pushEnabledKey) ?? true;
    });
  }

  Color Finalcolor() {
    return isPushEnabled ? Colors.pink : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Finalcolor().withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 6,
              offset: const Offset(0, -1),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            iconSize: 30,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedIconTheme: const IconThemeData(
              color: Colors.black,
            ),
            selectedIconTheme: IconThemeData(
              color: Finalcolor(),
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
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool getSwitchState() {
    return isSwitched;
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool isSwitched = false;
  bool isPushEnabled = false; // Initialize switch state
  final String _pushEnabledKey = 'push_enabled';
  late Color textColor;
  @override
  void initState() {
    super.initState();
    _loadSwitchState();
    textColor = isPushEnabled
        ? Colors.red
        : Colors.pink; // Load switch state when widget initializes
  }

  Color Finalcolor() {
    return isPushEnabled ? Colors.pink : Colors.red;
  }

  void navigateToNotificationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationPage(color: Finalcolor()),
      ),
    );
  }

  // Function to load switch state from SharedPreferences
  Future<void> _loadSwitchState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Retrieve switch state, default to false if not found
      isSwitched = prefs.getBool('switchState') ?? false;
      isPushEnabled = prefs.getBool(_pushEnabledKey) ?? true;
    });
  }

  // Function to save switch state to SharedPreferences
  Future<void> _saveSwitchState() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_pushEnabledKey, isPushEnabled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 208, 208),
                Color.fromARGB(255, 255, 255, 255)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.7],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              navigateToNotificationPage(context);
            },
            child: Image.asset(
              'assets/bell.png',
              width: 23,
              height: 25,
            ),
          ),
          const SizedBox(width: 10),
          Switch(
            value: isPushEnabled, // Initialize switch value
            onChanged: (value) {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
                isPushEnabled = value;
                _saveSwitchState(); // Save switch state when changed
              });
            },
            activeTrackColor: Colors.red,
            activeColor: Colors.red,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Finalcolor(),
          ),
        ),
      ),
    );
  }
}
