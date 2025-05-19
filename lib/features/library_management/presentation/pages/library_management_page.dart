import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/presentation/components/progress_indicator.dart';

// class LibraryManagementPage extends ConsumerWidget {
//   const LibraryManagementPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final categoriesFuture = ref.watch(allCategoriesProvider);
//
//     return categoriesFuture.when(
//       data: (categories) => GridView.extent(
//         maxCrossAxisExtent: 500.0,
//         mainAxisSpacing: 16.0,
//         crossAxisSpacing: 16.0,
//         padding: const EdgeInsets.all(24.0),
//         children: [
//           for (final category in categories)
//             CategoryTile(
//               category: category,
//             ),
//         ],
//       ),
//       error: (Object error, StackTrace stackTrace) => Text(error.toString()),
//       loading: () => const LoadingIndicator(),
//     );
//   }
// }

// final droppedFilesProvider = StateProvider<List<File>>((ref) => []);
//
// class LibraryManagementPage extends ConsumerWidget {
//   const LibraryManagementPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final droppedFiles = ref.watch(droppedFilesProvider);
//     final droppedFilesNotifier = ref.read(droppedFilesProvider.notifier);
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('File Drag and Drop')),
//       body: DropTarget(
//         onDragEntered: (_) {
//           // You can show a visual indicator when a file is dragged over
//         },
//         onDragExited: (_) {
//           // Reset visual indicator when the drag exits
//         },
//         onDragDone: (details) {
//           // Update the provider with the dropped files
//           droppedFilesNotifier.state = details.files.map((file) => File(file.path)).toList();
//         },
//         child: Container(
//           color: Colors.grey.withOpacity(0.2),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 if (droppedFiles.isEmpty)
//                   const Text('Drop files here', style: TextStyle(fontSize: 18))
//                 else
//                   ...droppedFiles.map((file) => Text(file.path, style: const TextStyle(fontSize: 14))),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }