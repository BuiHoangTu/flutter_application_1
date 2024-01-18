import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final List<String> pages;

  final String currentPage;

  const MyDrawer({required this.pages, required this.currentPage, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: pages.length + 1, // +1 is for header ??
        itemBuilder: (context, index) {
          if (index == 0) {
            // header
            return const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "Drawer Header",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            );
          }

          final page = pages[index - 1];
          final isSelected = page == currentPage;

          return ListTile(
            title: Text(page),
            onTap: () {
              // TODO: naviage
            },
            selected: isSelected,
            selectedTileColor: Colors.red[200],
          );
        },
      ),
    );
  }
}
