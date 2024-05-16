import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/di/storage_managers/storage_managers_di.dart';
import '../../business/entities/category_entity.dart';
import '../../business/entities/supplementary_structures/file_location.dart';

class CollectionPage extends ConsumerStatefulWidget {
  final CategoryEntity category;

  const CollectionPage({
    required this.category,
    super.key,
  });

  @override
  ConsumerState createState() => _CollectionPageState();
}

class _CollectionPageState extends ConsumerState<CollectionPage> {
  List<({String bucket, String name})> fileVersions = [];

  List<Uint8List> fileBytes = [];

  void _onAddFilesPressed() {
    FilePicker.platform
        .pickFiles()
        .then((result) async {
      if (result == null) return;

      final objectStorageManager =
          await ref.watch(objectStorageManagerProvider.future);

      for (final file in result.files) {
        final bytes = file.bytes;
        final bucket = DefaultCategories.images.name;
        final fileName = file.name;

        print(bytes);

        if (bytes == null) continue;

        fileVersions.add((bucket: bucket, name: fileName));

        objectStorageManager.write(
          bytes,
          ObjectLocation(
            bucket: bucket,
            objectName: fileName,
          ),
        );
      }

      setState(() async {
        for (final fileInfo in fileVersions) {
          fileBytes.add(
            await objectStorageManager.read(
              ObjectLocation(
                bucket: fileInfo.bucket,
                objectName: fileInfo.name,
              ),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: _onAddFilesPressed,
            icon: const Icon(
              Icons.file_upload,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (final file in fileBytes)
                  ListTile(
                    title: Text(file.toString()),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
