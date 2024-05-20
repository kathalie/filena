import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state_management/collection_page_states.dart';

class AddCollectionDialog extends ConsumerWidget {
  final TextEditingController _textFieldController = TextEditingController();
  final String parentCollectionId;

  AddCollectionDialog({
    required this.parentCollectionId,
    super.key,
  });

  void _cancel(BuildContext context) {
    Navigator.pop(context);
  }

  void _confirmSave(
    BuildContext context,
    WidgetRef ref,
  ) {
    final res = ref
        .read(childCollectionsProvider(parentCollectionId).notifier)
        .addCollection(
          parentCollectionId: parentCollectionId,
          name: _textFieldController.text,
        );

    res.then((_) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Створити колекцію'),
      content: TextField(
        controller: _textFieldController,
        decoration: const InputDecoration(hintText: 'Назва колекції'),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => _confirmSave(context, ref),
          child: const Text('Зберегти'),
        ),
        ElevatedButton(
          onPressed: () => _cancel(context),
          child: const Text('Відмінити'),
        ),
      ],
    );
  }
}
