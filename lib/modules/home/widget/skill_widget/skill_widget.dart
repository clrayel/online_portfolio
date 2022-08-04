import 'package:flutter/material.dart';
import 'package:online_portfolio/modules/home/data/models/skill_icon.dart';

import '../../../../../core/text_style/text_styles.dart';
import '../body_container.dart';
import '../rounded_opacity_container.dart';
import 'skill_description_widget.dart';
import 'skill_icon_widget.dart';

class SkillWidget extends StatefulWidget {
  final List<SkillIcon> skills;

  const SkillWidget({
    Key? key,
    required this.skills,
  }) : super(key: key);

  @override
  State<SkillWidget> createState() => _SkillSectionState();
}

class _SkillSectionState extends State<SkillWidget> {
  String skillName = "";
  String _description = "Press a button to view my skills!";

  @override
  Widget build(BuildContext context) {
    return BodyContainer(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Skills",
            style: getTitleStyle(Colors.white, true),
          ),
          RoundedOpacityContainer(
            color: Colors.black.withOpacity(0.8),
            child: Column(
              children: [
                Text(
                  "Programming Languages and Markdown",
                  style: getHeader1Style(Colors.white, true),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.skills
                          .map(
                            (skill) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(20)),
                              onPressed: () {
                                String skillText = skill.skillDescription;
                                setState(() {
                                  _description = skillText;
                                });
                              },
                              child: SkillIconWidget(skill: skill),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                SkillDescriptionWidget(
                  skillDescription: _description,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
