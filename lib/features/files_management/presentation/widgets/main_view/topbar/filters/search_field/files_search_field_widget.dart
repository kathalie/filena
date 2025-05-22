import 'package:flutter/material.dart';

import '../../../../../../../../core/presentation/const/icons_const.dart';
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
    return Container(
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
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Icon(
              IconsConst.search,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildSearchField(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: 'Search in current folder',
        hintStyle: TextStyle(color: Colors.grey.shade500),
        border: InputBorder.none,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
      ),
      onChanged: widget._vm.updateSearchQuery,
      style: const TextStyle(fontSize: 16),
    );
  }
}
