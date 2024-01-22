import 'package:flutter/material.dart';

class AppTable extends StatelessWidget {
  final List<String> headers;
  final List<List<String>> data;
  final String? tableName;

  const AppTable(
      {super.key, required this.headers, required this.data, this.tableName});

  @override
  Widget build(BuildContext context) {
    Text? tableNameAsText;
    if (tableName != null) tableNameAsText = Text(tableName!);

    int rowsPerPage = 5;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: PaginatedDataTable(
            header: tableNameAsText,
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.blue),
            rowsPerPage: rowsPerPage,
            columns: headers
                .map((header) => DataColumn(label: Text(header)))
                .toList(growable: false),
            source: _AppTableDataSource(data),
            availableRowsPerPage: [rowsPerPage, rowsPerPage * 2],
          ),
        ),
      ),
    );
  }
}

class _AppTableDataSource extends DataTableSource {
  final List<List<String>> _data;

  _AppTableDataSource(this._data);

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) {
      return null;
    }

    return DataRow(
      // wrap each text in DataCell
      cells: _data[index].map((dataItem) => DataCell(Text(dataItem))).toList(),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
