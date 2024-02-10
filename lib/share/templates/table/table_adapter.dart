import 'package:flutter/material.dart';

abstract class TableAdapter<T> {
  final List<DataColumn> headers;

  TableAdapter({required this.headers});

  List<Widget> convert(T data);

  void onRowClick(T data);
}
