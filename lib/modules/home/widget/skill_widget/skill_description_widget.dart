import 'package:flutter/material.dart';

import '../../../../../core/text_style/text_styles.dart';
import '../rounded_opacity_container.dart';

class SkillDescriptionWidget extends StatelessWidget {
  final String skillDescription;
  const SkillDescriptionWidget({Key? key, required this.skillDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 700,
          minWidth: 500,
        ),
        child: RoundedOpacityContainer(
          color: Colors.white,
          child: Container(
              alignment: Alignment.center,
              child: Text(
                skillDescription,
                style: getBodyStyle(),
              )),
        ),
      ),
    );
  }
}
