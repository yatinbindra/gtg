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
          SizedBox(width: 10),
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
          Icon(Icons.search, size: 150),
          Icon(Icons.pin_drop, size: 150),
          Icon(Icons.feed, size: 150),
          Icon(Icons.account_circle, size: 150),
        ],
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
                  margin: EdgeInsets.all(10),
                  child: Image.network(images[pagePosition]),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Radisson Blu Kaushambi',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Another Widget',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Another Widget',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            color: Colors.blue,
            child: Center(
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
