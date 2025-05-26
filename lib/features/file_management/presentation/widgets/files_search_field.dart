import 'package:flutter/material.dart';

import '../../../../core/const/icons_const.dart';
import '../presenters/files_search_field_presenter.dart';

class FilesSearchField extends StatelessWidget {
  const FilesSearchField({super.key});

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
            child: _SearchField(),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends StatefulWidget {
  final _vm = FilesSearchFieldPresenter();

  _SearchField();

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
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
