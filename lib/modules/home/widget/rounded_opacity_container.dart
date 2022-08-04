import 'package:flutter/material.dart';

class RoundedOpacityContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Alignment? alignment;
  final double padding;
  final double margin;
  const RoundedOpacityContainer({
    Key? key,
    required this.child,
    this.color,
    this.alignment,
    this.padding = 30,
    this.margin = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        color: color,
      ),
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      alignment: alignment,
      child: child,
    );
  }
}
