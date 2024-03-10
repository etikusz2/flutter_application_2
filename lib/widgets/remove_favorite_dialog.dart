import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/state/MyAppState.dart';

Future<void> showRemoveDialog(
    BuildContext context, WordPair pair, MyAppState appState) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Remove Favorite'),
        content: Text(
            'Are you sure you want to remove "${pair.asLowerCase}" from your favorites?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );

  if (result == true) {
    appState.removeFavorite(pair);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${pair.asLowerCase} removed from favorites")),
    );
  }
}
