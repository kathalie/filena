// import 'package:flutter/material.dart';
//
// import '../../business/domain/category_entity.dart';
// import '../../business/domain/collection_entity.dart';
// import '../pages/collection_page.dart';
//
// class CollectionTile extends StatelessWidget {
//   final CategoryEntity currentCategory;
//   final CollectionEntity collection;
//
//   const CollectionTile({
//     required this.currentCategory,
//     required this.collection,
//     super.key,
//   });
//
//   _goToCollection(BuildContext context, CollectionEntity collection) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CollectionPage(
//           currentCollectionId: collection.id,
//           currentCategory: currentCategory,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => _goToCollection(context, collection),
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.folder),
//           Text(collection.name),
//         ],
//       ),
//     );
//   }
// }
