// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:gtg/pages/verified.dart';

class Item_page extends StatefulWidget {
  const Item_page({Key? key}) : super(key: key);

  @override
  State<Item_page> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Item_page> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(width: 10),
          Image.asset(
            'assets/gtg1.png',
            width: 54,
            height: 54,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 50.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildImageCarousel(),
          // Add other widgets for different pages
          const Icon(Icons.search, size: 150),
          const Icon(Icons.pin_drop, size: 150),
          const Icon(Icons.feed, size: 150),
          const Icon(Icons.account_circle, size: 150),
        ],
      ),
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

  Widget _buildImageCarousel() {
    double height = MediaQuery.of(context).size.height;
    PageController _pageController =
        PageController(viewportFraction: 1, initialPage: 0);
    List<String> images = [
      "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
      "https://wallpaperaccess.com/full/2637581.jpg",
      "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: height * 0.3,
            child: PageView.builder(
              itemCount: images.length,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {});
              },
              itemBuilder: (context, pagePosition) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.network(images[pagePosition]),
                );
              },
            ),
          ),
          const Text(
            'Radisson Blu Kaushambi',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 15), // Add padding to the right
                child: Container(
                  height: 32,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.circular(3), // Adjust the radius as needed
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Add space between text and image

                      Image.asset('assets/star.png', width: 20, height: 20),
                      const SizedBox(width: 8),
                      const Text(
                        '4.4',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      // Adjust the image path and size
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'About',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Designed with the view of providing you an opulent experience, the Radisson Blu Kaushambi is located in close proximity to New- Delhi railway station connected via metro. After being blessed by the holy Akshardham temple, relax in one of the comfortable well-designed rooms and suits built in high style and practical touch along with amazing wifi, coffee and tea facilities. To satisfy your vegetarian hunger, the restaurant provides various dishes to international and Indian favourites, making them a perfect pick for wedding functions like sangeet, cocktail, mehendi or sangeet.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Venue Info',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Another Widget',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Another Widget',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
