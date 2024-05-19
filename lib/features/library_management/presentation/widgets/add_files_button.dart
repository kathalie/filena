import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AddFileButton extends StatelessWidget {
//   const AddFileButton({super.key});
//
//   void _onPressed() {
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: _onPressed,
//       icon: const Icon(
//         Icons.file_upload,
//       ),);
//   }
// }

class AddFilesButton extends ConsumerWidget {
  final String parentCollectionId;

  const AddFilesButton({
    required this.parentCollectionId,
    super.key,
  });

  void _onAddFilesPressed() {
    // FilePicker.platform.pickFiles().then((result) async {
    //   if (result == null) return;
    //
    //   final objectStorageManager =
    //   await ref.watch(objectStorageManagerProvider.future);
    //
    //   for (final file in result.files) {
    //     final bytes = file.bytes;
    //     final bucket = DefaultCategories.images.name;
    //     final fileName = file.name;
    //
    //     print(bytes);
    //
    //     if (bytes == null) continue;
    //
    //     fileVersions.add((bucket: bucket, name: fileName));
    //
    //     objectStorageManager.write(
    //       bytes,
    //       ObjectLocation(
    //         bucket: bucket,
    //         objectName: fileName,
    //       ),
    //     );
    //   }
    //
    //   setState(() async {
    //     for (final fileInfo in fileVersions) {
    //       fileBytes.add(
    //         await objectStorageManager.read(
    //           ObjectLocation(
    //             bucket: fileInfo.bucket,
    //             objectName: fileInfo.name,
    //           ),
    //         ),
    //       );
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: _onAddFilesPressed,
      icon: const Icon(
        Icons.file_upload,
      ),
    );
  }
}
