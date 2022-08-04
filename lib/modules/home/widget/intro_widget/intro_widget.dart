import 'package:flutter/material.dart';
import 'package:online_portfolio/modules/home/data/models/short_description.dart';

import '../../domain/image_getter.dart';
import '../../widget/short_description_widget/short_description_widget.dart';
import '../body_container.dart';

class IntroWidget extends StatefulWidget {
  final ShortDescription about;

  const IntroWidget({
    Key? key,
    required this.about,
  }) : super(key: key);

  @override
  State<IntroWidget> createState() => _IntroSectionState();
}

class _IntroSectionState extends State<IntroWidget> {
  ImgGetter img = ImgGetter();

  @override
  Widget build(BuildContext context) {
    return BodyContainer(
      width: 700,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: img.getBlueProfile(),
                )),
          ),
          ShortDescriptionWidget(
            description: widget.about,
          ),
        ],
      ),
    );
  }
}
