import 'package:flutter/material.dart';
import 'package:apartment_building_manager_replica/share/components/app_bar.dart';
import 'package:apartment_building_manager_replica/share/components/app_drawer.dart';
import 'package:apartment_building_manager_replica/share/templates/table/app_table.dart';
import 'package:apartment_building_manager_replica/share/templates/table/adapter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Widget> pagesMapping = {
      "Home": const MyHomePage(),
      "Others": const MyHomePage()
    };

    return Scaffold(
      appBar: const MyAppBar(title: "Home"),
      drawer: MyDrawer(
        pagesMapping: pagesMapping,
        currentPage: "Home",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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
