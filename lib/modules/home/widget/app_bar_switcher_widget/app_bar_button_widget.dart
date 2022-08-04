import 'package:flutter/material.dart';

import '../../../../core/text_style/text_styles.dart';

class AppBarButtonWidget extends StatelessWidget {
  final String text;
  final ScrollController scrollController;
  final GlobalKey buttonKey;

  const AppBarButtonWidget({
    GlobalKey? key,
    required this.text,
    required this.scrollController,
    required this.buttonKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => scrollController.position.ensureVisible(
        buttonKey.currentContext?.findRenderObject() as RenderBox,
        duration: const Duration(milliseconds: 500),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text,
          style: getBodyStyle(Colors.white, true),
        ),
      ),
    );
  }
}
