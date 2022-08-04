import 'package:flutter/material.dart';

import '../domain/image_getter.dart';
import '../widget/app_bar_switcher_widget/app_bar_switcher_widget.dart';
import '../widget/contacts_widget/contacts_widget.dart';
import '../widget/education_widget/education_widget.dart';
import '../widget/intro_widget/intro_widget.dart';
import '../widget/skill_widget/skill_widget.dart';
import '../widget/trivia_widget/trivia_widget.dart';
import '../widget/works_widget/works_widget.dart';

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

  final _home = GlobalKey();
  final _skills = GlobalKey();
  final _works = GlobalKey();
  final _education = GlobalKey();
  final _contact = GlobalKey();
  final _appBarAKey = UniqueKey();
  final _appBarBKey = UniqueKey();

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
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
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
        appBar: AppBarSwitcherWidget(
          scrollPosition: _scrollPosition,
          home: _home,
          skills: _skills,
          works: _works,
          education: _education,
          contact: _contact,
          appBarAKey: _appBarAKey,
          appBarBKey: _appBarBKey,
          scrollController: _scrollController,
        ),
        body: Stack(
          children: [
            buildBody(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: TriviaWidget(),
            ),
          ],
        ),
      ),
    );
  }

  buildBody() => Scrollbar(
        controller: _scrollController,
        thickness: 20,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              IntroWidget(
                key: _home,
              ),
              SkillWidget(
                key: _skills,
              ),
              WorksWidget(
                key: _works,
              ),
              EducationWidget(
                key: _education,
              ),
              ContactsWidget(
                key: _contact,
              ),
            ],
          ),
        ),
      );
}
