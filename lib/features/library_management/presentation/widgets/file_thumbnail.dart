import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/entities/file_entity.dart';

class FileThumbnail extends ConsumerWidget {
  final FileEntity fileEntity;

  const FileThumbnail({
    required this.fileEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Image.memory(fileEntity.content);
  }
}
