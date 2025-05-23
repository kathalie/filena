import 'package:flutter/material.dart';

import '../../../../domain/entities/file_entity.dart';
import 'file_row/file_row.dart';
import 'files_table_vm.dart';

class FilesTable extends StatelessWidget {
  final _vm = FilesTablePresenter();

  FilesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FileEntity>>(
      stream: _vm.files,
      builder: (context, snapshot) {
        final fileEntities = snapshot.data ?? [];

        return DataTable(
          columns: _buildDataColumn(),
          rows: fileEntities
              .map((fileEntity) => FileRow(fileEntity).build())
              .toList(),
        );
      },
    );
  }

  List<DataColumn> _buildDataColumn() {
    final columnCaptions = [
      '',
      'Name',
      'Favourite',
      'Size',
      'Last modified',
      'Created',
      '',
    ];

    return columnCaptions
        .map(
          (caption) => DataColumn(
            label: Expanded(child: Text(caption)),
          ),
        )
        .toList();
  }
}
