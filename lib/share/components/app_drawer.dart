import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final Map<String, Widget> pagesMapping;

  final String currentPage;

  const MyDrawer(
      {required this.pagesMapping, required this.currentPage, super.key});

  MyDrawer.changePage(MyDrawer original, String newPage, {super.key})
      : pagesMapping = original.pagesMapping,
        currentPage = newPage;

  @override
  Widget build(BuildContext context) {
    var pages = pagesMapping.keys.toList(growable: false);

    return Drawer(
      child: ListView.builder(
        itemCount: pages.length + 1, // +1 is for header
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return pagesMapping.values.elementAt(index - 1);
                  }),
                ),
              );
            },
            selected: isSelected,
            selectedTileColor: Colors.red[200],
          );
        },
      ),
    );
  }
}
