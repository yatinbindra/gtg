import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isWhatsAppEnabled = true;
  bool isPushEnabled = true;
  @override
  Widget build(BuildContext context) {
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
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          // WhatsApp Messages Option
          SwitchListTile(
            title: const Text(
              'WhatsApp Messages',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black, // Change text color if needed
              ),
            ),
            subtitle: const Text('Get updates from us on WhatsApp'),
            value: isWhatsAppEnabled,
            activeColor: Colors.white,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.red.withOpacity(0.5),
            activeTrackColor:
                Colors.green.withOpacity(0.5), // Change toggle button color
            onChanged: (value) {
              setState(() {
                isWhatsAppEnabled = value;
              });
              // Implement functionality here
            },
          ),
          const Divider(height: 0), // Horizontal line divider
          // Another option with a button
          SwitchListTile(
            title: const Text(
              'Push Notifications',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black, // Change text color if needed
              ),
            ),
            subtitle: const Text('Turn on to get live route updates & offers'),
            value: isPushEnabled,
            activeColor: Colors.white,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.pink.withOpacity(0.5),
            activeTrackColor:
                Colors.green.withOpacity(0.5), // Change toggle button color
            onChanged: (value) {
              setState(() {
                isPushEnabled = value;
              });
              // Implement functionality here
            },
          ),
        ],
      ),
    );
  }
}
