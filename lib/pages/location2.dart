import 'package:flutter/material.dart';

import 'home.dart';

class ThirdPage extends StatefulWidget {
  final PageController pageController;

  const ThirdPage({Key? key, required this.pageController}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
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
            end: const Color.fromARGB(255, 248, 227, 0))
        .animate(_controller)
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
    return Hero(
      tag: "MyCard",
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
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          tooltip: 'Back Icon',
                          onPressed: () {
                            widget.pageController.animateToPage(
                              1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
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
                          const Text(
                            'Select mode',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: CategoryCard(),
                          ),
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
                                  3,
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

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryItem(
              AssetImage(
                'assets/pizza.png',
              ),
              "Foodie",
              '"Foodie Frenzy: Tasting Our Way Through Town"'),
          SizedBox(
            height: 10,
          ),
          _buildCategoryItem(AssetImage('assets/explorer.png'), "Explorer",
              "“Monumental Moments: Exploring Our Roots”"),
          SizedBox(
            height: 10,
          ),
          _buildCategoryItem(AssetImage('assets/adventurous.png'),
              "Adventurous", '"Chill Squad Hangs: Casual Vibes Only"'),
          SizedBox(
            height: 10,
          ),
          _buildCategoryItem(AssetImage('assets/wine.png'), "Chillaxed",
              '"Thrills & Chills: Adventure Awaits!"'),
          SizedBox(
            height: 10,
          ),
          _buildCategoryItem(AssetImage('assets/event.png'), "Unseen Events",
              '"FOMO-Free Zone: Exclusive Experiences Only"'),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(AssetImage image, String label, String label2) {
    return Row(
      children: [
        Container(
          width: 51, // Set the width of the image
          height: 51, // Set the height of the image
          child: Image(
            image: image, // Use the provided image
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: Color.fromARGB(255, 206, 49, 49), fontSize: 16),
            ),
            Text(
              label2,
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
