import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/icons_const.dart';
import '../../../../core/const/theme_const.dart';
import '../change_notifiers/current_prompt.dart';
import '../change_notifiers/prompt_bar_visibility.dart';

class PromptBar extends StatelessWidget {
  const PromptBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _ToggleButton(),
          Expanded(
            child: _SlideAnimation(),
          ),
        ],
      ),
    );
  }

}

class _SlideAnimation extends ConsumerWidget {
  const _SlideAnimation();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(promptBarVisibilityProvider);

    if (isVisible) return const _PromptBar();

    return Container();
  }
}

class _ToggleButton extends ConsumerWidget {
  const _ToggleButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final togglePromptBarVisibility =
    ref.read(promptBarVisibilityProvider.notifier).toggle;

    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(right: 8),
      decoration: _buildBoxDecoration(),
      child: IconButton(
        icon: const Icon(Icons.auto_fix_high),
        onPressed: togglePromptBarVisibility,
      ),
    );
  }
}

class _PromptBar extends StatelessWidget {
  const _PromptBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildBoxDecoration(),
      child: const Stack(
        alignment: Alignment.centerRight,
        children: [
          _TextArea(),
          Positioned(
            right: 16,
            child: _SendButton(),
          ),
        ],
      ),
    );
  }
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

class _SendButton extends ConsumerWidget {
  const _SendButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final processPrompt =
        ref.read(currentPromptProvider.notifier).submitPrompt;

    return PlatformIconButton(
      icon: const Icon(IconsConst.send),
      onPressed: processPrompt,
    );
  }
}

class _TextArea extends ConsumerWidget {
  const _TextArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPromptText = ref.watch(currentPromptProvider);
    final updatePrompt =
        ref.read(currentPromptProvider.notifier).update;


    return TextField(
      controller: TextEditingController(text: currentPromptText)
        ..selection = TextSelection.collapsed(offset: currentPromptText.length),
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
      onChanged: updatePrompt,
    );
  }
}