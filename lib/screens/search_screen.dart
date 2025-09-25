import 'package:flutter/material.dart';
import 'package:travel_app_ui/Model/model.dart';
import 'package:travel_app_ui/screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  List<LocationDetail> filteredLocations = locationItems;

  void search(String text) {
    setState(() {
      query = text;
      filteredLocations = locationItems.where((loc) => loc.name.toLowerCase().contains(text.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: const Color(0xFFA36C88),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: search,
              decoration: const InputDecoration(
                hintText: 'Search locations...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLocations.length,
              itemBuilder: (context, index) {
                LocationDetail location = filteredLocations[index];
                return ListTile(
                  leading: Image.asset(location.image, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(location.name),
                  subtitle: Text(location.address),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(location: location),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
