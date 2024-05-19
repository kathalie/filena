import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/widgets/progress_indicator.dart';
import '../state_management/collection_page_states.dart';
import 'file_thumbnail_tile.dart';

class FilesSliverGrid extends ConsumerWidget {
  final String currentCollectionId;

  const FilesSliverGrid({
    required this.currentCollectionId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childFilesFuture = ref.watch(
      childFilesProvider(currentCollectionId),
    );

    return childFilesFuture.when(
      data: (files) => SliverMainAxisGroup(
        slivers: [
          if (files.isNotEmpty)
            SliverList(
              delegate: SliverChildListDelegate([
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Інше'),
                      Divider(
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          SliverGrid.extent(
            maxCrossAxisExtent: 300,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            children: [
              for (final file in files) FileThumbnailTile(fileEntity: file),
            ],
          ),
        ],
      ),
      error: (Object error, StackTrace _) => SliverList(
        delegate: SliverChildListDelegate([
          Text(error.toString()),
        ]),
      ),
      loading: () => SliverList(
        delegate: SliverChildListDelegate([
          const LoadingIndicator(),
        ]),
      ),
    );
  }
}
