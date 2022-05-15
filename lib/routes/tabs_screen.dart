// import "package:flutter/material.dart";
// import 'package:restaurant_app/routes/favorites_screen.dart';
// import '../routes/categories_screen.dart';

// class TabsSceen extends StatefulWidget {
//   @override
//   State<TabsSceen> createState() => _TabsSceenState();
// }

// class _TabsSceenState extends State<TabsSceen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 0,
//       // indicates the index page
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("meals"),
//           bottom: TabBar(
//             indicatorColor: Colors.white,
//             labelColor: Colors.white,
//             enableFeedback: false,
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: "category",
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: "favorites",
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [CategoriesScreen(), FavoritesScreen()],
//         ),
//       ),
//     );
//   }
// }
