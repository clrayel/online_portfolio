import 'package:flutter/material.dart';

import '../../../../core/text_style/text_styles.dart';
import '../../data/models/short_description.dart';
import '../rounded_opacity_container.dart';

class EducationEntryWidget extends StatelessWidget {
  final ShortDescription item;
  final Color? color;
  final bool? hasShadow;
  const EducationEntryWidget(
      {Key? key,
      required this.item,
      this.color = Colors.black,
      this.hasShadow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedOpacityContainer(
      margin: 10,
      color: Colors.white.withOpacity(0.9),
      child: Container(
        height: (MediaQuery.of(context).size.height / 2),
        padding: const EdgeInsets.symmetric(
          vertical: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item.title,
                style: getHeader1Style(color, hasShadow),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Divider(
                    color: Colors.black,
                  ),
                  Text(
                    item.subtitle,
                    style: getSubtitleStyle(color, hasShadow),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        item.body,
                        style: getBodyStyle(color, hasShadow),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
