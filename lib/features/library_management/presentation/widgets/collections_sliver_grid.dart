// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../core/presentation/widgets/progress_indicator.dart';
// import '../../business/domain/category_entity.dart';
// import '../state_management/collection_page_states.dart';
// import 'collection_tile.dart';
//
// class CollectionsSliverGrid extends ConsumerWidget {
//   final String currentCollectionId;
//   final CategoryEntity currentCategory;
//
//   const CollectionsSliverGrid({
//     required this.currentCollectionId,
//     required this.currentCategory,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final childCollectionsFuture = ref.watch(
//       childCollectionsProvider(currentCollectionId),
//     );
//
//     return childCollectionsFuture.when(
//       data: (collections) => SliverGrid.extent(
//         maxCrossAxisExtent: 300,
//         crossAxisSpacing: 16.0,
//         mainAxisSpacing: 16.0,
//         children: [
//           for (final collection in collections)
//             CollectionTile(
//               currentCategory: currentCategory,
//               collection: collection,
//             ),
//         ],
//       ),
//       error: (Object error, StackTrace _) => SliverList(
//         delegate: SliverChildListDelegate([
//           Text(error.toString()),
//         ]),
//       ),
//       loading: () => SliverList(
//         delegate: SliverChildListDelegate([
//           const LoadingIndicator(),
//         ]),
//       ),
//     );
//   }
// }
