import 'package:flutter/material.dart';
import 'package:systemic_55/SplashScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(''),
          ),
          const SizedBox(height: 20),
          const Text(
            'HelloPeople',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Hello5455@gmail.com',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implement action here
            },
            child: const Text('Edit Profile'),
          ),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text('+9327071730'),
          ),
          const ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Makarpura,vadodara'),
          ),
          const ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Joined on March 1, 2024'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SplashScreen()));
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
