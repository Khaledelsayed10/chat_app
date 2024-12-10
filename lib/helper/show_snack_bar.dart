import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      closeIconColor: Colors.black,
      content: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
    ),
  );
}
