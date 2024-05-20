import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';

class AddFilesButton extends ConsumerWidget {
  final String parentCollectionId;

  const AddFilesButton({
    required this.parentCollectionId,
    super.key,
  });

  void _onAddFilesPressed(WidgetRef ref) {
    // ref.read(childFilesProvider(parentCollectionId).notifier).addFile(
    //       parentCollectionId: parentCollectionId,
    //       name: 'meow.png',
    //       dateCreated: DateTime.now(),
    //       sizeInBytes: 0,
    //       content: Uint8List(5),
    //       description: null,
    //       tagIds: [],
    //       isFavourite: false,
    //     );
    FilePicker.platform.pickFiles(
        allowMultiple: true,
      type: FileType.custom,
      // allowedExtensions: ,
    ).then((result) async {
      if (result == null) return;

      // final objectStorageManager =
      // await ref.watch(objectStorageManagerProvider.future);

      for (final file in result.files) {
        // final bytes = file.readStream.;
        // final bucket = DefaultCategories.images.name;
        final fileName = file.name;

        // print(bytes.);

        // if (bytes == null) continue;

        // fileVersions.add((bucket: bucket, name: fileName));
        //
        // objectStorageManager.write(
        //   bytes,
        //   ObjectLocation(
        //     bucket: bucket,
        //     objectName: fileName,
        //   ),
        // );
      }

      // setState(() async {
      //   for (final fileInfo in fileVersions) {
      //     fileBytes.add(
      //       await objectStorageManager.read(
      //         ObjectLocation(
      //           bucket: fileInfo.bucket,
      //           objectName: fileInfo.name,
      //         ),
      //       ),
      //     );
      //   }
      // });
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => _onAddFilesPressed(ref),
      icon: const Icon(
        Icons.file_upload,
      ),
    );
  }
}
