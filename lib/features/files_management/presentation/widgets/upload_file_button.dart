import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/icons_const.dart';
import '../../../folders_management/domain/entities/folder_entity.dart';
import '../../../folders_management/presentation/change_notifiers/selected_folder.dart';
import '../presenters/upload_file_button_presenter.dart';


class UploadFileButton extends ConsumerWidget {
  const UploadFileButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadState = ref.watch(uploadStateProvider);
    final selectedFolder = ref.watch(selectedFolderProvider);

    if (uploadState.error != null) {
      Future.microtask(() {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(uploadState.error!),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ref.read(uploadStateProvider.notifier).clearError();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
    }

    return PlatformIconButton(
      onPressed: uploadState.isLoading
          ? null
          : () => pickAndUploadFile(context, ref, selectedFolder),
      icon: uploadState.isLoading
          ? const CircularProgressIndicator()
          : const Icon(IconsConst.upload),
    );
  }

  Future<void> pickAndUploadFile(
      BuildContext context,
      WidgetRef ref,
      FolderEntity? selectedFolder,
      ) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      final paths = result.files.map((file) => file.path).whereType<String>();

      for (final path in paths) {
        await ref.read(uploadStateProvider.notifier).createFile(path, selectedFolder);
      }
    }
  }
}