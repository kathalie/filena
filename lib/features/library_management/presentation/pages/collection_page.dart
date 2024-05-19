import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/usecases/library_management_usecases_di.dart';
import '../../../../core/presentation/widgets/progress_indicator.dart';
import '../../business/entities/collection_entity.dart';
import '../../business/entities/file_entity.dart';
import '../widgets/add_collection_button.dart';
import '../widgets/add_files_button.dart';
import '../widgets/collection_tile.dart';
import '../widgets/file_thumbnail_tile.dart';

class CollectionPage extends ConsumerStatefulWidget {
  final List<String> allowedExtensions;
  final String currentCollectionId;

  const CollectionPage({
    required this.allowedExtensions,
    required this.currentCollectionId,
    super.key,
  });

  @override
  ConsumerState createState() => _CollectionPageState();
}

class _CollectionPageState extends ConsumerState<CollectionPage> {
  CollectionEntity? _currentCollection;
  List<CollectionEntity>? _childCollections;
  List<FileEntity>? _childFiles;

  @override
  Widget build(BuildContext context) {
    ref
        .watch(gettCollectionUseCaseProvider)
        (collectionId: widget.currentCollectionId)
        .then((value) {
      setState(() {
        _currentCollection = value;
      });
    });

    ref
        .watch(getCollectionsWithinCollectionUsecaseProvider)(
      parentCollectionId: widget.currentCollectionId,
    )
        .then((value) {
      setState(() {
        _childCollections = value;
      });
    });

    ref
        .watch(getFilesWithinCollectionUsecaseProvider)(
      parentCollectionId: widget.currentCollectionId,
    )
        .then((value) {
      setState(() {
        _childFiles = value;
      });
    });

    final currentCollection = _currentCollection;
    final childCollections = _childCollections;
    final childFiles = _childFiles;

    if (currentCollection == null ||
        childCollections == null ||
        childFiles == null) {
      return const LoadingIndicator();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentCollection.name),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: Row(
                children: [
                  AddCollectionButton(parentCollectionId: currentCollection.id),
                  AddFilesButton(parentCollectionId: currentCollection.id),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverGrid.extent(
              maxCrossAxisExtent: 300,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                for (final collection in childCollections)
                  CollectionTile(
                    allowedExtensions: widget.allowedExtensions,
                    collection: collection,
                  ),
              ],
            ),
          ),
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
              for (final file in childFiles) FileThumbnailTile(fileEntity: file),
            ],
          ),
        ],
      ),
    );
  }
}
