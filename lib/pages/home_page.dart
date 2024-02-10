import 'package:apartment_building_manager_replica/share/session_data.dart';
import 'package:flutter/material.dart';
import 'package:apartment_building_manager_replica/share/components/app_bar.dart';
import 'package:apartment_building_manager_replica/share/templates/table/app_table.dart';
import 'package:apartment_building_manager_replica/share/templates/table/table_adapter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Home",
        userId: sessionUserId,
        username: sessionUsername,
      ),
      drawer: sessionDrawer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTable(
              data: const [
                ["Data 1-1", "Data 1-2"],
                ["Data 2-1", "Data 2-2"],
              ],
              adapter: _TableAdapterList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TableAdapterList implements TableAdapter<List<String>> {
  @override
  List<Widget> convert(List<String> data) {
    return data.map((str) => SelectableText(str)).toList(growable: false);
  }

  @override
  List<DataColumn> get headers => ["Header 1", "Header2"]
      .map((header) => DataColumn(label: SelectableText(header)))
      .toList(growable: false);

  @override
  void onRowClick(List<String> data) {
    // ignore: avoid_print
    print(data);
    // ignore: avoid_print
    print("is clicked");
  }
}
