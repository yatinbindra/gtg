import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'account.dart';
import 'item_page.dart';
import 'location.dart';
import 'navDrawer';
import 'news.dart';
import 'notification.dart';
import 'profile.dart';
import 'search.dart';

void main() {
  runApp(MyApp());
}

class Restaurant {
  final String name;
  final String tag;
  final double rating;
  final String price;
  final String imagePath;

  Restaurant({
    required this.name,
    required this.tag,
    required this.rating,
    required this.price,
    required this.imagePath,
  });
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
        '/account': (context) => ProfilePage(),
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
    ProfilePage(),
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

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryItem(Icons.compass_calibration, "Foodie"),
                _buildCategoryItem(Icons.compass_calibration, "Explorer"),
                _buildCategoryItem(Icons.hiking, "Adventurous"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryItem(Icons.local_bar, "Chillaxed"),
                _buildCategoryItem(Icons.event, "Unseen Events"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.red.shade300),
        Text(
          label,
          style: TextStyle(
            color: Colors.red.shade300,
          ),
        ),
      ],
    );
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
        builder: (context) => NotificationPage(),
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

  List<Restaurant> restaurants = [
    Restaurant(
        name: 'QuickSpoon',
        tag: 'Relaxed',
        rating: 3.8,
        price: '₹500',
        imagePath: 'assets/quick.png'),
    Restaurant(
        name: 'AllEarthed',
        tag: 'Food',
        rating: 4.2,
        price: '₹300',
        imagePath: 'assets/allearthed.jpg'),
    Restaurant(
        name: 'Spicehood',
        tag: 'Adventurous',
        rating: 4.6,
        price: '₹800',
        imagePath: 'assets/spicehood.jpg'),
  ];

  Widget buildRestaurantCard(Restaurant restaurant) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding around the card
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the top
          children: <Widget>[
            Container(
              width: 118,
              height: 118,
              margin: const EdgeInsets.only(
                  right: 8.0), // Add margin between image and text
              child: Image.asset(
                restaurant.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  restaurant.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.blue,
                      size: 16,
                    ), // Change icon color
                    const SizedBox(width: 4), // Add space between icon and text
                    Text(
                      restaurant.tag,
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16), // Change text color
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      restaurant.rating.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                // Pushes the price to the right edge
                Text('Avg. ${restaurant.price} /Person',
                    style: TextStyle(
                        color: Finalcolor())), // Positioned at the right side
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    String imagePath = Finalcolor() == Colors.pink
        ? 'assets/homePage2.png'
        : 'assets/homePage.png';
    return Scaffold(
      drawer: NavDrawer(),
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
            activeTrackColor: Color.fromARGB(241, 255, 113, 158),
            activeColor: Colors.pink,
            inactiveThumbColor: Colors.red,
            inactiveTrackColor: Color.fromARGB(224, 255, 206, 81),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(155, 206, 49, 49),
                    Color.fromARGB(151, 255, 255, 255),
                    Color.fromARGB(105, 255, 127, 123),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20.0), // Add some space
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.zero, // Set margin to zero
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          32.0), // Match the image's border radius
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 15.0),
                          const Text(
                            "Let's Good To Go!",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const SizedBox(width: 25),
                              Icon(
                                Icons.location_on,
                                color: Finalcolor(),
                                size: 30,
                              ),
                              const SizedBox(width: 15),
                              const Expanded(
                                child: Text(
                                  'Kalkaji, New Delhi ; 3:32 UTC',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.access_time,
                                color: Finalcolor(),
                                size: 30,
                              ),
                              const SizedBox(width: 25),
                            ],
                          ),
                          const Divider(
                            height: 20,
                            thickness: 1,
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            width: double.infinity,
                            height: 59,
                            decoration: BoxDecoration(
                              color: Finalcolor(),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Item_page()),
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Start',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward,
                                      color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Add more widgets as needed
                  const SizedBox(height: 20),
                  // Star Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              '   What’s near me   ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    physics:
                        const NeverScrollableScrollPhysics(), // to disable ListView's scrolling
                    shrinkWrap:
                        true, // to make ListView occupy space only its children need
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Item_page()),
                          );
                        },
                        child: buildRestaurantCard(restaurants[index]),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // Star Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              '   Search by modes   ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: CategoryCard(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
