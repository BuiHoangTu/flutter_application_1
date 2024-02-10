import 'package:apartment_building_manager_replica/pages/placeholder_page.dart';
import 'package:apartment_building_manager_replica/share/components/app_drawer.dart';
import 'package:apartment_building_manager_replica/share/session_data.dart';
import 'package:flutter/material.dart';
import 'package:apartment_building_manager_replica/pages/home_page.dart';

void main() {
  Map<String, Widget> pagesMapping = {
    "Home": const MyHomePage(),
    "Others": const PlaceHolderPage(),
  };

  sessionUserId = "123";
  sessionUsername = "BHTu";
  sessionDrawer = MyDrawer(
    pagesMapping: pagesMapping,
    currentPage: "Home",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
