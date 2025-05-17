import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/progress_indicator.dart';
import '../widgets/add_collection_button.dart';
import '../widgets/add_files_button.dart';
import '../widgets/collections_sliver_grid.dart';
import '../widgets/files_sliver_grid.dart';

// class CollectionPage extends ConsumerWidget {
//   final String currentCollectionId;
//
//   const CollectionPage({
//     required this.currentCollectionId,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentCollection = ref.watch(
//       currentCollectionProvider(currentCollectionId),
//     );
//
//     return currentCollection.when(
//       data: (collection) => Scaffold(
//         appBar: AppBar(
//           title: Text(collection.name),
//           backgroundColor: Theme.of(context).primaryColor,
//           foregroundColor: Colors.white,
//         ),
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               pinned: true,
//               automaticallyImplyLeading: false,
//               flexibleSpace: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 16,
//                 ),
//                 child: Row(
//                   children: [
//                     AddCollectionButton(parentCollectionId: collection.id),
//                     AddFilesButton(
//                       parentCollectionId: collection.id,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             CollectionsSliverGrid(
//               currentCollectionId: collection.id,
//             ),
//             FilesSliverGrid(currentCollectionId: collection.id),
//           ],
//         ),
//       ),
//       error: (Object error, StackTrace _) =>
//           Center(child: Text(error.toString())),
//       loading: () => const Center(child: LoadingIndicator()),
//     );
//   }
// }
