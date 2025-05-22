import 'package:flutter/material.dart';

import 'files_search_field_vm.dart';

class FilesSearchField extends StatefulWidget {
  final _vm = FilesSearchFieldViewModel();

  FilesSearchField({super.key});

  @override
  State<FilesSearchField> createState() => _FilesSearchFieldState();
}

class _FilesSearchFieldState extends State<FilesSearchField> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');

    widget._vm.searchQuery.listen((query) {
      if (_controller.text != query) {
        _controller.text = query;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            // Search icon
            Icon(
              Icons.search,
              color: Colors.grey.shade600,
            ),
            const SizedBox(width: 8),
            // Search text field
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: 'Search in current folder',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
                onChanged: widget._vm.updateSearchQuery,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            // Clear button (only shows when text is present)
            StreamBuilder<String>(
              stream: widget._vm.searchQuery,
              builder: (context, snapshot) {
                final hasText = snapshot.data?.isNotEmpty == true;

                return AnimatedOpacity(
                  opacity: hasText ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: hasText
                      ? GestureDetector(
                    onTap: () {
                      widget._vm.clearSearchQuery();
                      _focusNode.requestFocus();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.close,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                    ),
                  )
                      : const SizedBox(width: 8),
                );
              },
            ),
            // Apply search button
            StreamBuilder<String>(
              stream: widget._vm.searchQuery,
              builder: (context, snapshot) {
                final hasText = snapshot.data?.isNotEmpty == true;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: hasText ? 40 : 0,
                  child: hasText
                      ? IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      // Execute search
                      // You could add additional logic here
                      // to handle the actual search execution
                      FocusScope.of(context).unfocus();
                    },
                  )
                      : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}