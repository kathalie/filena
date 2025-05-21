import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../core/presentation/const/icons_const.dart';
import 'upload_file_button_vm.dart';

class UploadFileButton extends StatelessWidget {
  final UploadFileButtonViewModel _vm = UploadFileButtonViewModel();

  UploadFileButton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO Error dialog on _error
    return StreamBuilder<bool>(
      stream: _vm.isLoading,
      builder: (context, snapshot) {
        final isLoading = snapshot.data ?? false;

        return PlatformElevatedButton(
          onPressed: isLoading ? null : _vm.pickAndUploadFile,
          child: isLoading
              ? _buildButtonCaption()
              : const CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildButtonCaption() {
    return const Row(
      children: [
        Icon(IconsConst.upload),
        Text('Pick & Upload File'),
      ],
    );
  }
}