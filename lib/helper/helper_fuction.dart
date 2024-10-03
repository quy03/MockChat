import 'package:flutter/material.dart';

void displayMessageToUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Thông báo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "OK",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      );
    },
  );
}
