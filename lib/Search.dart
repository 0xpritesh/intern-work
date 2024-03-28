import 'package:flutter/material.dart';

// ignore: camel_case_types
class searchscreen extends StatefulWidget {
  const searchscreen({super.key});

  @override
  State<searchscreen> createState() => _searchscreenState();
}

// ignore: camel_case_types
class _searchscreenState extends State<searchscreen> {
  List<String> people = List.generate(10, (index) => 'Person ${index + 1}');
  List<String> filteredPeople = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    filteredPeople = people
                        .where((person) =>
                            person.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search people...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredPeople.isEmpty
                    ? people.length
                    : filteredPeople.length,
                itemBuilder: (context, index) {
                  final person = filteredPeople.isEmpty
                      ? people[index]
                      : filteredPeople[index];
                  return ListTile(
                    title: Text(person),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
