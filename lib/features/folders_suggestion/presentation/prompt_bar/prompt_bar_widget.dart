import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../core/presentation/const/icons_const.dart';
import '../../../../core/presentation/const/theme_const.dart';
import 'prompt_bar_presenter.dart';

class PromptBar extends StatelessWidget {
  final _presenter = PromptBarPresenter();

  PromptBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _buildToggleButton(),
          Expanded(
            child: _buildSlideAnimation(),
          ),
        ],
      ),
    );
  }

  BorderSide _buildBorderSide() {
    return const BorderSide(color: ThemeConsts.primaryColor);
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      border: Border.fromBorderSide(_buildBorderSide()),
      color: Colors.white,
      borderRadius: BorderRadius.circular(32),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          spreadRadius: 1,
        ),
      ],
    );
  }

  Widget _buildToggleButton() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(right: 8),
      decoration: _buildBoxDecoration(),
      child: IconButton(
        icon: const Icon(Icons.auto_fix_high),
        onPressed: _presenter.toggleVisibility,
      ),
    );
  }

  Widget _buildSlideAnimation() {
    return StreamBuilder<bool>(
      stream: _presenter.isVisible,
      builder: (context, snapshot) {
        final isVisible = snapshot.data ?? false;

        return _buildPromptBar();
      },
    );
  }

  Widget _buildPromptBar() {
    return StreamBuilder<String>(
      stream: _presenter.promptText,
      builder: (context, snapshot) {
        final text = snapshot.data ?? '';

        return Container(
          decoration: _buildBoxDecoration(),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              _buildTextArea(text),
              Positioned(
                right: 16,
                child: _buildSendButton(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSendButton() {
    return PlatformIconButton(
      icon: const Icon(IconsConst.send),
      onPressed: _presenter.processPrompt,
    );
  }

  Widget _buildTextArea(String text) {
    return TextField(
      controller: TextEditingController(text: text)
        ..selection = TextSelection.collapsed(offset: text.length),
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: _buildBorderSide(),
          borderRadius: BorderRadius.circular(24.0),
        ),
        hintText: 'Describe what and how you want to organize!',
        hintStyle: const TextStyle(color: Colors.black54),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: _presenter.updatePrompt,
    );
  }
}
