import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home.dart';

class FivthPage extends StatefulWidget {
  final PageController pageController;

  const FivthPage({Key? key, required this.pageController}) : super(key: key);

  @override
  State<FivthPage> createState() => _FivthPageState();
}

class RectangleSliderThumbShape extends SliderComponentShape {
  final double thumbWidth;
  final double thumbHeight;

  const RectangleSliderThumbShape({
    required this.thumbWidth,
    required this.thumbHeight,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbWidth, thumbHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? value,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final rect = Rect.fromCenter(
      center: center,
      width: thumbWidth,
      height: thumbHeight,
    );

    final Paint paint = Paint()
      ..color = sliderTheme?.thumbColor ?? Colors.grey
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(8.0)), paint);
  }
}

class _FivthPageState extends State<FivthPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;
  double _value = 3.0;
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
                              3,
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
                              'assets/way.jpg',
                              width: 328,
                              height: 215,
                            ),
                          ),
                          const SizedBox(height: 41),
                          const Text(
                            'Select range in kilometeres',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.black),
                          ),

                          const SizedBox(height: 40),

                          // Add vertical spacing
                          Column(
                            children: [
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 25.0,
                                  trackShape: RoundedRectSliderTrackShape(),
                                  activeTrackColor: Colors.red.shade800,
                                  inactiveTrackColor:
                                      Colors.red.withOpacity(0.2),
                                  thumbShape: RectangleSliderThumbShape(
                                      thumbWidth: 28.0, thumbHeight: 40.0),
                                  thumbColor: Color.fromARGB(255, 239, 16, 0),
                                  tickMarkShape: RoundSliderTickMarkShape(),
                                  activeTickMarkColor: Colors.red.shade800,
                                  inactiveTickMarkColor:
                                      Colors.red.withOpacity(0.0),
                                  valueIndicatorShape:
                                      PaddleSliderValueIndicatorShape(),
                                  valueIndicatorColor:
                                      Colors.red.withOpacity(0.2),
                                  valueIndicatorTextStyle: TextStyle(
                                    color: Colors.red.shade800,
                                    fontSize: 25.0,
                                  ),
                                ),
                                child: Slider(
                                  min: 0.0,
                                  max: 6.0,
                                  value: _value,
                                  divisions: 6,
                                  label: '${_value.round()}',
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '$_value km',
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.black),
                              ),
                            ],
                          ),

                          const SizedBox(height: 39), // Add vertical spacing
                          // Add vertical spacing
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
                                  5,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Find',
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
