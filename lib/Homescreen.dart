// ignore: file_names
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> people = List.generate(10, (index) => 'Person ${index + 1}');
  List<String> filteredPeople = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "Dating People",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredPeople.isEmpty
                  ? people.length
                  : filteredPeople.length,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text("Vikram"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
