import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'item_page.dart';

class Verified extends StatelessWidget {
  const Verified({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/gtg1.png',
                          width: 54,
                          height: 54,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.2,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/shield1.gif',
                      width: 180,
                      height: 180,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Verified!',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Color.fromARGB(255, 111, 212, 76)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Congratulations! You have been',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                        Text(
                          'successfully authenticated.',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 60,
                    width: 363,
                    child: TextButton(
                      child: Text('Continue',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          )),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 206, 49, 49)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Item_page()),
                        );
                      },
                    ),
                  )
                ]))));
  }
}
