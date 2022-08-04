import 'package:flutter/material.dart';

import '../../data/models/skill_icon.dart';
import '../../domain/image_getter.dart';

class SkillIconWidget extends StatelessWidget {
  final SkillIcon skill;
  SkillIconWidget({Key? key, required this.skill}) : super(key: key);
  ImgGetter img = ImgGetter();

  @override
  Widget build(BuildContext context) {
    return Image(
      image: img.getSkillIcon(skill.iconLocation),
      height: 50,
    );
  }
}
