import 'package:flutter/material.dart';

abstract class TableAdapter<T> {
  final List<Widget> headers;

  TableAdapter({required this.headers});

  List<Widget> convert(T data);
}
