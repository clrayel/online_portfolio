import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/text_style/text_styles.dart';
import '../../data/models/short_description.dart';
import '../../domain/image_getter.dart';
import '../body_container.dart';
import '../rounded_opacity_container.dart';
import 'works_carousel_widget.dart';

class WorksWidget extends StatefulWidget {
  final List<ShortDescription> works;

  const WorksWidget({
    Key? key,
    required this.works,
  }) : super(key: key);

  @override
  State<WorksWidget> createState() => _WorksSectionState();
}

class _WorksSectionState extends State<WorksWidget> {
  ImgGetter img = ImgGetter();
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BodyContainer(
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
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                  ),
                  child: WorksCarouselWidget(
                    works: widget.works,
                    controller: controller,
                  ),
                ),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => controller.previousPage(),
                        icon: const Icon(
                          Icons.navigate_before,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () => controller.nextPage(),
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
