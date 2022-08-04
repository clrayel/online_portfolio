import 'package:flutter/material.dart';

import '../../../../core/text_style/text_styles.dart';

class WhiteTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final int? lines;
  final String hintText;
  const WhiteTextFieldWidget({
    Key? key,
    required this.controller,
    this.lines,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        validator: ((value) {
          if (value == null || value.isEmpty) return 'Please enter some text';
          return null;
        }),
        controller: controller,
        maxLines: lines,
        style: const TextStyle(
          color: Colors.white,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          label: Text(
            hintText,
            style: getBodyStyle(Colors.white),
          ),
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          constraints: const BoxConstraints(
            maxWidth: 500,
          ),
        ),
      ),
    );
  }
}
