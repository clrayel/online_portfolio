import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_portfolio/modules/home/domain/image_getter.dart';
import 'package:online_portfolio/modules/home/modules/works/widget/works_widget.dart';
import 'package:online_portfolio/modules/home/widget/special_containers/rounded_opacity_container.dart'; // Fix imports

import '../../../../../core/text_style/text_styles.dart';
import '../../../../core/home_data/home_data.dart';
import '../../widget/special_containers/body_container.dart';

class WorksSection extends StatefulWidget {
  const WorksSection({Key? key}) : super(key: key);

  @override
  State<WorksSection> createState() => _WorksSectionState();
}

class _WorksSectionState extends State<WorksSection> {
  HomeData data = HomeData();
  ImgGetter img = ImgGetter();
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BodyContainer(
      // width: 1500, <-- Remove comment
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "My Works",
            style: getTitleStyle(Colors.white, true),
          ),
          RoundedOpacityContainer(
            color: Colors.black.withOpacity(0.8),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                  ),
                  child: WorksWidget(
                    works: data.works,
                    controller: controller,
                  ),
                ),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => controller.previousPage(), // <-- Make a private method for this.
                        icon: const Icon(
                          Icons.navigate_before,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () => controller.nextPage(),// <-- Make a private method for this.
                        icon: const Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
