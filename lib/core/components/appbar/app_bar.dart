import 'package:flutter/material.dart';

AppBar getAppBar(String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.blue,
    elevation: 0.0,
    title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
  );
}
