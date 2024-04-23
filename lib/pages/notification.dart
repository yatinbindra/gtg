import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final Color color;

  const NotificationPage({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color textColor = color == Colors.pink ? Colors.pink : Colors.red;
    String imagePath = color == Colors.pink
        ? 'assets/notification_pink.png'
        : 'assets/notification.png';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 50.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          tooltip: 'Back Icon',
          onPressed: () {},
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
      body: Center(
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
