import 'package:flutter/material.dart';
import 'package:gtg/pages/location2.dart';

import 'home.dart';
import 'loaction1.dart';
import 'location3.dart';
import 'location4.dart';
import 'locationPreLoad.dart';
import 'route.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late int _pageIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageIndex = 0;
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        children: [
          MyFirstPage(pageController: _pageController),
          SecondPage(pageController: _pageController),
          ThirdPage(pageController: _pageController),
          FourthPage(pageController: _pageController),
          FivthPage(pageController: _pageController),
          PreLoadPage(pageController: _pageController),
          RoutePage(pageController: _pageController),
          
        ],
      ),
    );
  }
}

class MyFirstPage extends StatefulWidget {
  final PageController pageController;

  const MyFirstPage({Key? key, required this.pageController}) : super(key: key);

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animation = ColorTween(
      begin: const Color.fromARGB(255, 245, 17, 17),
      end: const Color.fromARGB(255, 248, 227, 0),
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _animation.value ??
                            const Color.fromARGB(255, 255, 242, 56),
                        const Color.fromARGB(255, 254, 180, 180)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
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
                          width: width * .15,
                        ),
                        const Text(
                          'Let’s Good To Go!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.5 - 275,
                  left: width * 0.5 - 189,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Container(
                      height: 550,
                      width: 370,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.zero, // Ensure no padding
                            child: Image.asset(
                              'assets/gtg1.png',
                              width: 85,
                              height: 85,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.zero, // Ensure no padding
                            child: Image.asset(
                              'assets/card1.png',
                              width: 349,
                              height: 198,
                            ),
                          ),
                          // Add vertical spacing
                          const Text(
                            'Mention number of friends',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.black),
                          ),
                          const SizedBox(height: 10), // Add vertical spacing
                          Container(
                            width: 70,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '______',
                              ),
                            ),
                          ),
                          const SizedBox(height: 10), // Add vertical spacing
                          Center(
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: <Widget>[
                                Chip(
                                  label: const Text('2'),
                                  backgroundColor: Colors.blue[50],
                                ),
                                Chip(
                                  label: const Text('4'),
                                  backgroundColor: Colors.blue[50],
                                ),
                                Chip(
                                  label: const Text('6'),
                                  backgroundColor: Colors.blue[50],
                                ),
                                Chip(
                                  label: const Text('8'),
                                  backgroundColor: Colors.blue[50],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14), // Add vertical spacing
                          Container(
                            width: double.infinity,
                            height: 65,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                widget.pageController.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Continue',
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: LocationPage(),
  ));
}
