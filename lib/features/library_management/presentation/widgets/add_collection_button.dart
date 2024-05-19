import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/usecases/library_management_usecases_di.dart';
import '../../business/usecases/create_collection.dart';

class AddCollectionButton extends ConsumerWidget {
  final String parentCollectionId;

  AddCollectionButton({required this.parentCollectionId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createCollection = ref.watch(createCollectionUsecaseProvider);

    return IconButton(
      onPressed: () => _displayTextInputDialog(context, createCollection),
      icon: const Icon(Icons.add),
    );
  }

  final TextEditingController _textFieldController = TextEditingController();

  void _cancel(BuildContext context) {
    Navigator.pop(context);
  }

  void _confirmSave(
    BuildContext context,
    CreateCollectionUseCase createCollection,
  ) {
    createCollection(
      name: _textFieldController.text,
      parentCollectionId: parentCollectionId,
    ).then((_) => Navigator.pop(context));
  }

  Future<void> _displayTextInputDialog(
    BuildContext context,
    CreateCollectionUseCase createCollection,
  ) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Створити колекцію'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Назва колекції'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => _confirmSave(context, createCollection),
              child: const Text('Зберегти'),
            ),
            ElevatedButton(
              onPressed: () => _cancel(context),
              child: const Text('Відмінити'),
            ),
          ],
        );
      },
    );
  }
}
