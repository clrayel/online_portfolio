import 'package:flutter/material.dart';
import 'package:online_portfolio/core/text_style/text_styles.dart';
import 'package:online_portfolio/modules/home/domain/image_getter.dart';
import 'package:online_portfolio/modules/home/sections/contacts_section/contacts_section.dart';

import '../sections/intro_section/intro_section.dart';
import '../sections/skill_section/skill_section.dart';
import '../sections/works_section/works_section.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImgGetter img = ImgGetter();
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  final _home = GlobalKey();
  final _skills = GlobalKey();
  final _works = GlobalKey();
  final _contact = GlobalKey();

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: img.diamondBackground,
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: _scrollPosition <= 500
            ? AppBar(
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
                  appbarButtons(_home, "Home"),
                  appbarButtons(_skills, "Skills"),
                  appbarButtons(_works, "Works"),
                  appbarButtons(_contact, "Contact Me"),
                ],
              )
            : AppBar(
                centerTitle: true,
                backgroundColor: Colors.black.withOpacity(0.8),
                elevation: 0.0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appbarButtons(_home, "Home"),
                    appbarButtons(_skills, "Skills"),
                    appbarButtons(_works, "Works"),
                    appbarButtons(_contact, "Contact Me"),
                  ],
                ),
              ),
        body: buildBody(),
      ),
    );
  }

  // buildBody() => Scrollbar(
  //       thickness: 20,
  //       controller: _pageController,
  //       isAlwaysShown: true,
  //       child: PageView(
  //         controller: _pageController,
  //         scrollDirection: Axis.vertical,
  //         children: [
  //           const IntroSection(),
  //           const SkillSection(),
  //           const WorksSection(),
  //           ContactsSection(),
  //         ],
  //       ),
  //     );
  buildBody() => Scrollbar(
        controller: _scrollController,
        thickness: 20,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              IntroSection(
                key: _home,
              ),
              SkillSection(
                key: _skills,
              ),
              WorksSection(
                key: _works,
              ),
              ContactsSection(
                key: _contact,
              ),
            ],
          ),
        ),
      );

  Widget appbarButtons(GlobalKey key, String text) => TextButton(
        onPressed: () => _scrollController.position.ensureVisible(
          key.currentContext?.findRenderObject() as RenderBox,
          duration: const Duration(seconds: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: getBodyStyle(Colors.white, true),
          ),
        ),
      );
}
