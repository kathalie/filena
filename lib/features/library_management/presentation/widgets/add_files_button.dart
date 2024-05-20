import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';

import '../../business/entities/category_entity.dart';
import '../state_management/collection_page_states.dart';

class AddFilesButton extends ConsumerWidget {
  final String parentCollectionId;
  final CategoryEntity currentCategory;

  const AddFilesButton({
    required this.parentCollectionId,
    required this.currentCategory,
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
    FilePicker.platform
        .pickFiles(
      withData: true,
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: currentCategory.extensions,
    )
        .then((result) async {
      if (result == null) return;

      final childFiles = ref.read(childFilesProvider(parentCollectionId).notifier);

      for (final file in result.files) {
        await childFiles.addFile(
          parentCollectionId: parentCollectionId,
          platformFile: file,
        );
      }
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
