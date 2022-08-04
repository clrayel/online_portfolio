import 'package:flutter/material.dart';

class ImgGetter {
  getGardenProfile() => const Image(
        image: AssetImage('graphics/home_page/Rayel-Garden.jpg'),
        height: 700,
      );

  getBlueProfile() => const AssetImage('graphics/home_page/profile-blue.jpg');
  getSkillIcon(String location) => AssetImage(location);

  diamondBackground() => const AssetImage('graphics/home_page/diamond_bg.jpg');
  comsciBackground() => const AssetImage('graphics/home_page/comsci_bg.png');
}
