// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:gtg/pages/verified.dart';

import 'no_internet.dart';

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
          const Icon(Icons.pin_drop, size: 150),
          const Icon(Icons.feed, size: 150),
          const Icon(Icons.account_circle, size: 150),
        ],
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Carousel
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
          // Star Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  height: 32,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/star.png', width: 20, height: 20),
                      const SizedBox(width: 8),
                      const Text(
                        '4.4',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // About Section
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
          // Venue Info Section
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
          // Add your Venue Info list here
          VenueInfoList(), // <- Add your Venue Info List here
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Location',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          // Add more widgets below as needed
          Container(
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Location',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              height: 60,
              width: 363,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 206, 49, 49)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NoInternet()),
                  );
                },
                child: const Text('Add to the route',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    )),
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

class VenueInfoList extends StatelessWidget {
  final List<Map<String, dynamic>> venueInfo = [
    {'label': 'Payment', 'value': 'Cash, Credit Card', 'icon': Icons.payment},
    {'label': 'Booking Policy', 'value': 'Online, Phone', 'icon': Icons.book},
    {
      'label': 'Cancellation Policy',
      'value': '48 hours prior notice',
      'icon': Icons.cancel
    },
    {'label': 'Air Conditioning', 'value': 'Yes', 'icon': Icons.ac_unit},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8.0, // Adjust the spacing between items as needed
          runSpacing: 8.0, // Adjust the spacing between rows as needed
          children: venueInfo.map((info) {
            return SizedBox(
              width: MediaQuery.of(context).size.width / 2 -
                  16.0, // Adjust the width of each item as needed
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(info['icon']),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          info['label'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4.0),
                        Text(info['value']),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
