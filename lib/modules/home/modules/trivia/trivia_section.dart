import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_portfolio/core/home_data/home_data.dart';
import 'package:online_portfolio/core/text_style/text_styles.dart'; // <-- Fix import 

class TriviaSection extends StatefulWidget {
  const TriviaSection({Key? key}) : super(key: key);

  @override
  State<TriviaSection> createState() => _TriviaSectionState();
}

class _TriviaSectionState extends State<TriviaSection> {
  HomeData data = HomeData();

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
      itemCount: data.trivia.length,
      itemBuilder: (context, itemIndex, realIndex) {
        return Container(
          alignment: Alignment.center,
          color: Colors.black.withOpacity(0.6),
          width: MediaQuery.of(context).size.width,
          child: Text(
            data.trivia[itemIndex],
            style: getBodyStyle(Colors.white),
          ),
        );
      },
    );
  }
}
