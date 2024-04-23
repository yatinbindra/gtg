import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isWhatsAppEnabled = true;
  bool isPushEnabled = true;
  late Color textColor; // Variable to store text color

  // SharedPreferences key for saving state
  final String _whatsappEnabledKey = 'whatsapp_enabled';
  final String _pushEnabledKey = 'push_enabled';

  @override
  void initState() {
    super.initState();
    _loadSavedState();
    // Initialize text color based on initial toggle button state
    textColor = isWhatsAppEnabled ? Colors.red : Colors.black;
  }

  // Load saved state from SharedPreferences
  Future<void> _loadSavedState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isWhatsAppEnabled = prefs.getBool(_whatsappEnabledKey) ?? true;
      isPushEnabled = prefs.getBool(_pushEnabledKey) ?? true;
    });
  }

  // Save state to SharedPreferences
  Future<void> _saveState() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_whatsappEnabledKey, isWhatsAppEnabled);
    prefs.setBool(_pushEnabledKey, isPushEnabled);
  }

  Color whatsappInactiveTrackColor() {
    return isPushEnabled
        ? Colors.pink.withOpacity(0.5)
        : Colors.red.withOpacity(0.5);
  }

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
                color: Colors.black,
              ),
            ),
            subtitle: const Text('Get updates from us on WhatsApp'),
            value: isWhatsAppEnabled,
            activeColor: Colors.white,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: whatsappInactiveTrackColor(),
            activeTrackColor: Colors.green.withOpacity(0.5),
            onChanged: (value) {
              setState(() {
                isWhatsAppEnabled = value;
                // Update text color based on toggle button state
                textColor = isWhatsAppEnabled ? Colors.red : Colors.black;
                _saveState(); // Save state when changed
              });
            },
          ),
          const Divider(height: 0), // Horizontal line divider
          // Another option with a button
          SwitchListTile(
            title: const Text(
              'Push Notifications',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
            ),
            subtitle: const Text('Turn on to get live route updates & offers'),
            value: isPushEnabled,
            activeColor: Colors.white,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.red.withOpacity(0.5),
            activeTrackColor: Colors.green.withOpacity(0.5),
            onChanged: (value) {
              setState(() {
                isPushEnabled = value;
                _saveState(); // Save state when changed
              });
            },
          ),
        ],
      ),
    );
  }
}
