import 'package:flutter/material.dart';
import 'package:flutter_application_1/share/components/app_bar.dart';
import 'package:flutter_application_1/share/components/app_drawer.dart';
import 'package:flutter_application_1/share/templates/app_table.dart';
import 'package:flutter_application_1/share/templates/table/adapter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
      "Home": const MyHomePage(title: "Home"),
      "Others": const MyHomePage(title: "Home")
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
              headers: ["Header 1", "Header2"]
                  .map((e) => SelectableText(e))
                  .toList(growable: false),
              data: [
                ["Data 1-1", "Data 1-2"],
                ["Data 2-1", "Data 2-2"],
              ]
                  .map((es) =>
                      es.map((e) => SelectableText(e)).toList(growable: false))
                  .toList(growable: false),
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
}
