import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/presentation/const/icons_const.dart';
import '../../../domain/entities/folder_entity.dart';
import 'upload_file_button_vm.dart';

class UploadFileButton extends StatelessWidget {
  final UploadFileButtonPresenter _vm = UploadFileButtonPresenter();

  UploadFileButton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO Error dialog on _error
    return StreamBuilder<(bool, FolderEntity?)>(
      stream: Rx.combineLatest2(
        _vm.isLoading,
        _vm.selectedFolder,
        (isLoading, selectedFolder) => (isLoading, selectedFolder),
      ),
      builder: (context, snapshot) {
        final isLoading = snapshot.data?.$1 ?? false;
        final selectedFolderId = snapshot.data?.$2;

        return PlatformIconButton(
          onPressed:
              isLoading ? null : () => pickAndUploadFile(selectedFolderId),
          icon: isLoading
              ? const CircularProgressIndicator()
              : const Icon(IconsConst.upload),
        );
      },
    );
  }

  Future<void> pickAndUploadFile(FolderEntity? selectedFolderId) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      final paths = result.files.map((file) => file.path);

      _vm.isLoading.add(true);
      try {
        for (final path in paths) {
          await _vm.createFile(path!, selectedFolderId);
        }
      } catch (e) {
        _vm.error.add('Upload failed: $e');
      }
      finally {
        _vm.isLoading.add(false);
      }
    }
  }
}
