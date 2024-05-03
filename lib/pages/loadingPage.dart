import 'package:flutter/material.dart';
import 'dart:async';

import 'package:gtg/pages/home.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoadingPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            height: height,
            width: width,
            color: Color.fromARGB(255, 206, 49, 49),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SizedBox(
                    height: height * 0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/gtg2.png',
                          width: 289,
                          height: 272,
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
                          '"Now you are',
                          style: TextStyle(fontSize: 29.0, color: Colors.white),
                        ),
                        Text(
                          'Good To Go"!',
                          style: TextStyle(fontSize: 29.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ]))));
  }
}
