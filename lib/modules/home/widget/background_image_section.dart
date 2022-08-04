import 'package:flutter/material.dart';

class BackgroundImageSectionWidget extends StatelessWidget {
  final Widget child;
  final AssetImage imageProvider;
  final double? height;
  const BackgroundImageSectionWidget(
      {Key? key, required this.child, required this.imageProvider, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
