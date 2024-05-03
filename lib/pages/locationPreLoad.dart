import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

class PreLoadPage extends StatefulWidget {
  final PageController pageController;

  const PreLoadPage({Key? key, required this.pageController}) : super(key: key);

  @override
  State<PreLoadPage> createState() => _PreLoadPageState();
}

class _PreLoadPageState extends State<PreLoadPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    Timer(Duration(seconds: 6), () {
      widget.pageController.animateToPage(
        6,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
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
                        SizedBox(
                          width: width * .27,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.zero, // Ensure no padding
                            child: Image.asset(
                              'assets/gtg1.png',
                              width: 85,
                              height: 85,
                            ),
                          ),
                          const SizedBox(height: 90),
                          Container(
                            padding: EdgeInsets.zero, // Ensure no padding
                            child: Image.asset(
                              'assets/preLoad.gif',
                              width: 180,
                              height: 180,
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
