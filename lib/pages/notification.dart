// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NotificationPage> {
  bool isPushEnabled = false;
  final String _pushEnabledKey = 'push_enabled';
  @override
  void initState() {
    super.initState();
    _loadSwitchState(); // Load switch state when widget initializes
  }

  Future<void> _loadSwitchState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Retrieve switch state, default to false if not found
      isPushEnabled = prefs.getBool(_pushEnabledKey) ?? true;
    });
  }

  Color Finalcolor() {
    return isPushEnabled ? Colors.pink : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color textColor = Finalcolor() == Colors.pink ? Colors.pink : Colors.red;
    String imagePath = Finalcolor() == Colors.pink
        ? 'assets/notification_pink.png'
        : 'assets/notification.png';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              tooltip: 'Back Icon',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            title: const Text(
              'Notification Centre',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Center(
        // ignore: sized_box_for_whitespace
        child: Container(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 273,
                height: 205,
              ),
              const SizedBox(height: 20),
              Text(
                'Notification is empty',
                style: TextStyle(
                  fontSize: 25.0,
                  color: textColor, // Apply color to the text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
