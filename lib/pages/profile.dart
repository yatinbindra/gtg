import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(ProfilePage1());

class ProfilePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}

class Profile {
  final String userName;
  final String userMobile;
  final String userEmail;

  Profile(
      {required this.userName,
      required this.userMobile,
      required this.userEmail});
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Profile> profile = [
    Profile(
      userName: 'Gaman Arora',
      userMobile: '+91 9899211621',
      userEmail: 'gmnarora@gmail.com',
    ),
  ];

  Widget buildProfile(Profile profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.red.withOpacity(0.2),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.account_circle,
                    size: 80, // Adjust the size of the icon as needed
                    color: Colors.red.withOpacity(
                        0.9), // Adjust the color and opacity of the icon
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text('Name *',
            style: TextStyle(
              fontSize: 13.0,
              color: Color.fromARGB(255, 65, 65, 65),
            )),
        Container(
          height: 48,
          width: double.infinity, // to make it full width
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.3),
            borderRadius:
                BorderRadius.circular(10), // Adjust the radius as needed
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              profile.userName,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text('Mobile Number *',
            style: TextStyle(
              fontSize: 13.0,
              color: Color.fromARGB(255, 65, 65, 65),
            )),
        Container(
          height: 48,
          width: double.infinity, // to make it full width
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.3),
            borderRadius:
                BorderRadius.circular(10), // Adjust the radius as needed
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              profile.userMobile,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text('E-mail *',
            style: TextStyle(
              fontSize: 13.0,
              color: Color.fromARGB(255, 65, 65, 65),
            )),
        Container(
          height: 48,
          width: double.infinity, // to make it full width
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.3),
            borderRadius:
                BorderRadius.circular(10), // Adjust the radius as needed
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              profile.userEmail,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 60,
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 206, 49, 49)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ))),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
            child: const Text('Change mobile number',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                )),
          ),
        ),
        const SizedBox(height: 20),
        const Divider(
          height: 20,
          thickness: 1,
        ),
        const SizedBox(height: 20),
        Center(
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 255, 255, 255),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: const BorderSide(
                    color: Colors.black, // Specify the border color here
                    width: 2, // Specify the border width here
                  ),
                ),
              ),
            ),
            onPressed: () {
              // Implement delete account logic here
            },
            child: const Text('Delete Account',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                )),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Deleting your account will remove all your history, achievements and any active referral.',
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                  (route) => false,
                );
              },
            ),
            title: const Text(
              'Profile',
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
          padding: const EdgeInsets.all(16.0), child: buildProfile(profile[0])),
    );
  }
}
