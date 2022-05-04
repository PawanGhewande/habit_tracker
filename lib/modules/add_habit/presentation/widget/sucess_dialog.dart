import 'package:flutter/material.dart';

successDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Success'),
        content: const Text('Added new habit'),
        actions: [
          // TextButton(
          //   onPressed: () {},
          //   child: const Text('CANCEL'),
          // ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Okay'),
          ),
        ],
      );
    },
  );
}
