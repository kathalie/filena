import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../core/presentation/const/icons_const.dart';
import 'upload_file_button_vm.dart';

class UploadFileButton extends StatelessWidget {
  final UploadFileButtonPresenter _vm = UploadFileButtonPresenter();

  UploadFileButton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO Error dialog on _error
    return StreamBuilder<bool>(
      stream: _vm.isLoading,
      builder: (context, snapshot) {
        final isLoading = snapshot.data ?? false;

        return PlatformIconButton(
          onPressed: isLoading ? null : pickAndUploadFile,
          icon: isLoading
              ? const CircularProgressIndicator()
              : const Icon(IconsConst.upload),
        );
      },
    );
  }

  Future<void> pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      final paths = result.files.map((file) => file.path);

      _vm.isLoading.add(true);
      try {
        for (final path in paths) {
          await _vm.createFile(path!);
        }
      } catch (e) {
        _vm.error.add('Upload failed: $e');
        _vm.isLoading.add(false);
      }
    }
  }
}
