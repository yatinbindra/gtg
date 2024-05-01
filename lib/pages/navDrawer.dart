import 'package:flutter/material.dart';
import 'account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NavDrawer> {
  @override
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
    return isPushEnabled
        ? const Color.fromARGB(255, 240, 0, 76)
        : const Color.fromARGB(255, 206, 49, 49);
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
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
                Navigator.of(context).pop();
              },
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
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Finalcolor().withOpacity(0.2),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.account_circle,
                              size: 80, // Adjust the size of the icon as needed
                              color: Finalcolor().withOpacity(
                                  0.9), // Adjust the color and opacity of the icon
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Gaman Arora",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "9781347255",
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.chat,
                        color: Finalcolor(),
                      ),
                      title: const Text('Customer Chat Support'),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Finalcolor(),
                      ),
                      onTap: () {
                        // Handle the tap
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.history,
                        color: Finalcolor(),
                      ),
                      title: const Text('History'),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Finalcolor(),
                      ),
                      onTap: () {
                        // Handle the tap
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.info_outline,
                        color: Finalcolor(),
                      ),
                      title: const Text('About GTG'),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Finalcolor(),
                      ),
                      onTap: () {
                        // Handle the tap
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.notifications,
                        color: Finalcolor(),
                      ),
                      title: const Text('Notifications'),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Finalcolor(),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountPage()),
                        );
                      },
                    ),
                    SizedBox(
                      height: height * 0.3,
                    ),
                    Center(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(
                                color: Colors
                                    .black, // Specify the border color here
                                width: 1, // Specify the border width here
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Implement delete account logic here
                        },
                        child: Text('Log Out',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Finalcolor(),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Text(
                        "App version 24.3.4",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    ); // Add this closing parenthesis
  }
}
