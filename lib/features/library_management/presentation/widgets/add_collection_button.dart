// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'add_collection_dialog.dart';
//
// class AddCollectionButton extends ConsumerWidget {
//   final String parentCollectionId;
//
//   const AddCollectionButton({required this.parentCollectionId, super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return IconButton(
//       onPressed: () => _displayTextInputDialog(context),
//       icon: const Icon(Icons.add),
//     );
//   }
//
//   Future<void> _displayTextInputDialog(
//     BuildContext context,
//   ) async {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AddCollectionDialog(parentCollectionId: parentCollectionId,);
//       },
//     );
//   }
// }
