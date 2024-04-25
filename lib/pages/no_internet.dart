// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'allow_location.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                  Image.asset(
                    'assets/offline.png',
                    width: 257,
                    height: 193,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Looks Like You Are Offline',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Color.fromARGB(255, 206, 49, 49)),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No internet connection found.',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                        Text(
                          'Check your connection or try again.',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
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
                          MaterialPageRoute(builder: (context) => AllowLocation()),
                        );
                      },
                      child: const Text('Retry',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          )),
                    ),
                  )
                ]))));
  }
}
