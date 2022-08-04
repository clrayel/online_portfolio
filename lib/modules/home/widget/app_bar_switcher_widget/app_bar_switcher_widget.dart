import 'package:flutter/material.dart';
import 'package:online_portfolio/modules/home/widget/app_bar_switcher_widget/app_bar_button_widget.dart';

import '../../../../core/text_style/text_styles.dart';

class AppBarSwitcherWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double scrollPosition;
  final ScrollController scrollController;
  final GlobalKey home;
  final GlobalKey skills;
  final GlobalKey works;
  final GlobalKey education;
  final GlobalKey contact;
  final UniqueKey appBarAKey;
  final UniqueKey appBarBKey;
  const AppBarSwitcherWidget({
    Key? key,
    required this.scrollPosition,
    required this.home,
    required this.skills,
    required this.works,
    required this.education,
    required this.contact,
    required this.appBarAKey,
    required this.appBarBKey,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeIn,
      duration: const Duration(
        milliseconds: 250,
      ),
      child: scrollPosition <= 500 ? appBarA() : appBarB(),
    );
  }

  Widget appBarA() => AppBar(
        key: appBarAKey,
        title: Text(
          "CARLOS RAYEL",
          style: getTitleStyle(
            Colors.white,
            true,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          AppBarButtonWidget(
            buttonKey: home,
            text: "Home",
            scrollController: scrollController,
          ),
          AppBarButtonWidget(
            buttonKey: skills,
            text: "Skills",
            scrollController: scrollController,
          ),
          AppBarButtonWidget(
            buttonKey: works,
            text: "Works",
            scrollController: scrollController,
          ),
          AppBarButtonWidget(
            buttonKey: education,
            text: "Education",
            scrollController: scrollController,
          ),
          AppBarButtonWidget(
            buttonKey: contact,
            text: "Contact Me",
            scrollController: scrollController,
          ),
        ],
      );
  Widget appBarB() => AppBar(
        key: appBarBKey,
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.8),
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBarButtonWidget(
              buttonKey: home,
              text: "Home",
              scrollController: scrollController,
            ),
            AppBarButtonWidget(
              buttonKey: skills,
              text: "Skills",
              scrollController: scrollController,
            ),
            AppBarButtonWidget(
              buttonKey: works,
              text: "Works",
              scrollController: scrollController,
            ),
            AppBarButtonWidget(
              buttonKey: education,
              text: "Education",
              scrollController: scrollController,
            ),
            AppBarButtonWidget(
              buttonKey: contact,
              text: "Contact Me",
              scrollController: scrollController,
            ),
          ],
        ),
      );

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(50, 50);
}
