import 'package:flutter/material.dart';
import 'home.dart';
import 'item_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SearchPage> {
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
    Restaurant(
        name: 'Spicehood',
        tag: 'Adventurous',
        rating: 4.6,
        price: '₹800',
        imagePath: 'assets/spicehood.jpg'),
    Restaurant(
        name: 'Spicehood',
        tag: 'Adventurous',
        rating: 4.6,
        price: '₹800',
        imagePath: 'assets/spicehood.jpg'),
  ];
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
      isPushEnabled = prefs.getBool(_pushEnabledKey) ?? true;
    });
  }

  Color Finalcolor() {
    return isPushEnabled ? Colors.pink : Colors.red;
  }

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
              color: Colors.white,
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Stack part (non-scrollable)
          Container(
            height: 260.0,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(105, 206, 49, 49),
                        Color.fromARGB(65, 255, 127, 123),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new_outlined),
                            tooltip: 'Back Icon',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: width * .31,
                          ),
                          const Text(
                            'Search',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: SizedBox(
                          width: 308,
                          height: 48,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: <Widget>[
                            Chip(
                              label: const Text('Jail Road'),
                              backgroundColor: Colors.pink[50],
                            ),
                            Chip(
                              label: const Text('Hauz Khas'),
                              backgroundColor: Colors.pink[50],
                            ),
                            Chip(
                              label: const Text('PVR'),
                              backgroundColor: Colors.pink[50],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Image.asset(
                    'assets/searchbg.png',
                    width: width,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Search Result',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          // Restaurant part (scrollable)
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Item_page(),
                      ),
                    );
                  },
                  child: buildRestaurantCard(restaurants[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
