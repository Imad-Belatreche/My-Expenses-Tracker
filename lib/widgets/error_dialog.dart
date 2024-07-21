import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'An Error Occurred!',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      content:
          const Text('Invalid input entered, please enter valid informations.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class CupertinoErrorDialog extends StatelessWidget {
  const CupertinoErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'An Error Occurred!',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      content:
          const Text('Invalid input entered, please enter valid informations.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
