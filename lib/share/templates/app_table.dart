import 'package:flutter/material.dart';

class AppTable extends StatelessWidget {
  final List<String> header;
  final List<List<String>> data;

  const AppTable({super.key, required this.header, required this.data});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.transparent),
      children: [
        _buildHeaderRow(),
        ..._buildDataRows(),
      ],
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: Colors.blue),
      children: List.generate(
        header.length,
        (index) => TableCell(
          child: Center(
            child: Text(
              header[index],
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  List<TableRow> _buildDataRows() {
    return data.asMap().entries.map((entry) {
      final rowData = entry.value;
      return TableRow(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey)),
        ),
        children: rowData
            .map(
              (dataItem) => TableCell(
                child: Center(child: Text(dataItem)),
              ),
            )
            .toList(),
      );
    }).toList();
  }
}
