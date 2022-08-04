import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/text_style/text_styles.dart';

class TriviaWidget extends StatefulWidget {
  final List<String> trivia;

  const TriviaWidget({
    Key? key,
    required this.trivia,
  }) : super(key: key);

  @override
  State<TriviaWidget> createState() => _TriviaSectionState();
}

class _TriviaSectionState extends State<TriviaWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 50,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: const Duration(
          seconds: 7,
        ),
      ),
      itemCount: widget.trivia.length,
      itemBuilder: (context, itemIndex, realIndex) {
        return Container(
          alignment: Alignment.center,
          color: Colors.black.withOpacity(0.6),
          width: MediaQuery.of(context).size.width,
          child: Text(
            widget.trivia[itemIndex],
            style: getBodyStyle(Colors.white),
          ),
        );
      },
    );
  }
}
