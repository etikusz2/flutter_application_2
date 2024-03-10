import 'package:flutter/material.dart';
import 'package:flutter_application_2/state/MyAppState.dart';
import 'package:flutter_application_2/widgets/remove_favorite_dialog.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView.builder(
      itemCount: appState.favorites.length,
      itemBuilder: (context, index) {
        final item = appState.favorites[index];
        return ListTile(
          leading: Icon(Icons.favorite),
          title: Text(item.asLowerCase),
          onTap: () => showRemoveDialog(
              context, item, appState), // Itt hívjuk meg a dialógust.
        );
      },
    );
  }
}
// class FavoritesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();

//     if (appState.favorites.isEmpty) {
//       return Center(
//         child: Text('No favorites yet.'),
//       );
//     }

// //     return ListView(
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.all(20),
// //           child: Text('You have '
// //               '${appState.favorites.length} favorites'),
// //         ),
// //         for (var pair in appState.favorites)
// //           ListTile(
// //             leading: Icon(Icons.favorite),
// //             title: Text(pair.asLowerCase),
// //           ),
// //       ],
// //     );
// //   }
// // }
//     return ListView.builder(
//       itemCount: appState.favorites.length,
//       itemBuilder: (context, index) {
//         final item = appState.favorites[index];
//         return Dismissible(
//           key: Key(item.asPascalCase), // Egyedi kulcs az elem azonosításához.
//           onDismissed: (direction) {
//             // Elem törlése a listából.
//             appState.removeFavorite(item);
//             // SnackBar megjelenítése az eltávolítás visszajelzésére.
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                   content: Text("${item.asLowerCase} removed from favorites")),
//             );
//           },
//           background: Container(
//               color:
//                   Colors.red), // Háttérszín, ami a csúsztatás során látszódik.
//           child: ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text(item.asLowerCase),
//           ),
//         );
//       },
//     );
//   }
// }
