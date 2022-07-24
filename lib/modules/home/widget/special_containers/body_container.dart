import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Color? backgroundColor;
  const BodyContainer(
      {Key? key,
      required this.child,
      this.backgroundColor,
      this.width = 1200,
      this.height = 500})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 100),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width,
          minHeight: height,
        ),
        child: child,
      ),
    );
  }
}
