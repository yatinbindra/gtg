import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home.dart';
import 'item_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'no_internet.dart';

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

class RoutePage extends StatefulWidget {
  final PageController pageController;
  const RoutePage({Key? key, required this.pageController}) : super(key: key);

  @override
  State<RoutePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RoutePage> {
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
    return isPushEnabled
        ? Color.fromARGB(255, 240, 0, 76)
        : Color.fromARGB(255, 206, 49, 49);
  }

  Widget buildRestaurantCard(Restaurant restaurant) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0), // Add padding around the card
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
                    style: TextStyle(color: Finalcolor())),
                // Positioned at the right side
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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
                tooltip: 'Back Icon',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
              ),
              title: const Text(
                'Routes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
            ),
          ),
        ),
        body: Container(
            height: height,
            width: width,
            color: Colors.white,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: height * 0.7,
                  ),
                  SizedBox(
                    height: 60,
                    width: 363,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 206, 49, 49)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NoInternet()),
                        );
                      },
                      child: const Text('Good To Go',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          )),
                    ),
                  )
                ]))));
  }
}
