import 'package:flutter/material.dart';

import '../../../../core/text_style/text_styles.dart';
import '../../data/models/short_description.dart';
import '../body_container.dart';
import 'education_entry_widget.dart';

class EducationWidget extends StatefulWidget {
  final List<ShortDescription> education;

  const EducationWidget({
    Key? key,
    required this.education,
  }) : super(key: key);

  @override
  State<EducationWidget> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      height: MediaQuery.of(context).size.height,
      child: BodyContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Education",
              style: getTitleStyle(Colors.white, true),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 50,
              ),
              child: Row(
                children: widget.education
                    .map(
                      (item) => Expanded(
                        child: EducationEntryWidget(item: item),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
