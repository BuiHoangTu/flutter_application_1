import 'package:flutter/material.dart';

abstract class TableAdapter<T> {
  List<Widget> convert(T data) {
    return [Text(data.toString())];
  }
}
