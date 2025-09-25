import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_ui/providers/bookmarks_provider.dart';
import 'package:travel_app_ui/screens/detail_screen.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        backgroundColor: const Color(0xFFA36C88),
      ),
      body: Consumer<BookmarksProvider>(
        builder: (context, bookmarksProvider, child) {
          final bookmarkedLocations = bookmarksProvider.bookmarkedLocations;
          if (bookmarkedLocations.isEmpty) {
            return const Center(
              child: Text('No bookmarks yet!'),
            );
          }
          return ListView.builder(
            itemCount: bookmarkedLocations.length,
            itemBuilder: (context, index) {
              final location = bookmarkedLocations[index];
              return ListTile(
                leading: Image.asset(location.image, width: 50, height: 50, fit: BoxFit.cover),
                title: Text(location.name),
                subtitle: Text(location.address),
                trailing: Text('\$${location.price}'),
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
          );
        },
      ),
    );
  }
}
