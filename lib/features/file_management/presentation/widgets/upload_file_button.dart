import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/icons_const.dart';
import '../../../folder_management/domain/entities/folder_entity.dart';
import '../../../folder_management/presentation/change_notifiers/selected_folder.dart';
import '../change_notifiers/file_upload_state.dart';

class UploadFileButton extends ConsumerWidget {
  const UploadFileButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadState = ref.watch(fileUploadStateProvider);
    final selectedFolderAsync = ref.watch(selectedFolderProvider);

    ref.listen<UploadState>(fileUploadStateProvider, (_, state) {
      if (state.error != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Error'),
              content: Text(state.error!),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.read(fileUploadStateProvider.notifier).clearError();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        });
      }
    });

    return PlatformIconButton(
      onPressed: uploadState.isLoading || selectedFolderAsync is AsyncLoading
          ? null
          : () => _pickAndUploadFiles(context, ref, selectedFolderAsync),
      icon: uploadState.isLoading
          ? const CircularProgressIndicator(
              padding: EdgeInsets.all(8.0),
            )
          : const Icon(IconsConst.upload),
    );
  }

  Future<void> _pickAndUploadFiles(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<FolderEntity> selectedFolderAsync,
  ) async {
    final selectedFolder = selectedFolderAsync.value;

    if (selectedFolder == null) return;

    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result == null) return;

    final filePaths = result.files.map((file) => file.path).whereType<String>();
    final uploader = ref.read(fileUploadStateProvider.notifier);

    for (final path in filePaths) {
      await uploader.createFile(path, selectedFolder);
    }
  }
}
