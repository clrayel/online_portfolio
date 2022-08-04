import 'package:flutter/material.dart';

import '../../../../core/text_style/text_styles.dart';
import '../../data/models/short_description.dart';

class ShortDescriptionWidget extends StatelessWidget {
  final bool? isScroll;
  final ShortDescription description;
  const ShortDescriptionWidget({
    Key? key,
    required this.description,
    this.isScroll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isScroll!) {
      return SingleChildScrollView(
        child: buildContent(),
      );
    }
    return buildContent();
  }

  Widget buildContent() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Text(
              description.title,
              style: getHeader1Style(
                description.textColor,
                description.hasShadow,
              ),
              textAlign:
                  description.alignLeft ? TextAlign.left : TextAlign.center,
            ),
            Divider(
              color: description.textColor,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            if (description.subtitle.isNotEmpty)
              Text(
                description.subtitle,
                style: getSubtitleStyle(
                    description.textColor, description.hasShadow),
                textAlign:
                    description.alignLeft ? TextAlign.left : TextAlign.center,
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              description.body,
              style: getBodyStyle(description.textColor, description.hasShadow),
              textAlign:
                  description.alignLeft ? TextAlign.left : TextAlign.center,
            ),
          ],
        ),
      );
}
