import 'package:flutter/material.dart';
import 'package:flutter_application_1/share/templates/table/adapter.dart';

class AppTable<T> extends StatelessWidget {
  final List<T> _data;
  final TableAdapter<T> _adapter;
  final String? _tableName;

  const AppTable(
      {super.key,
      required List<T> data,
      required TableAdapter<T> adapter,
      String? tableName})
      : _tableName = tableName,
        _adapter = adapter,
        _data = data;

  @override
  Widget build(BuildContext context) {
    SelectableText? tableNameAsText;
    if (_tableName != null) tableNameAsText = SelectableText(_tableName);

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
            columns: _adapter.headers
                .map((header) => DataColumn(label: header))
                .toList(growable: false),
            source: _AppTableDataSource(_data, _adapter, context),
            showCheckboxColumn: false,
            availableRowsPerPage: [rowsPerPage, rowsPerPage * 2],
          ),
        ),
      ),
    );
  }
}

class _AppTableDataSource<T> extends DataTableSource {
  final List<T> _data;
  final TableAdapter<T> _adapter;
  final BuildContext context;

  int lastSelectedRow = -1;
  late DateTime lastSelectTime;

  _AppTableDataSource(this._data, this._adapter, this.context);

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) {
      return null;
    }

    var isDesktop = true;
    var platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.windows:
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
        isDesktop = true;
      default:
        isDesktop = false;
    }

    return DataRow(
      // convert and wrap each element in DataCell
      cells: _adapter
          .convert(_data[index])
          .map((widget) => DataCell(widget))
          .toList(),
      onSelectChanged: (isSelected) {
        if (isDesktop) {
          // if desktop, double click
          if (lastSelectedRow == index &&
              DateTime.now().difference(lastSelectTime) > Durations.medium1) {
            _adapter.onRowClick(_data[index]);
          } else {
            lastSelectedRow = index;
            lastSelectTime = DateTime.now();
          }
        } else {
          // mobile, one click
          _adapter.onRowClick(_data[index]);
        }
      },
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
