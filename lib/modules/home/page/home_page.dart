import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/short_description.dart';
import '../data/models/skill_icon.dart';
import '../domain/bloc/home_bloc.dart';
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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: ((about, works, education, trivia, skills, phone, mail,
                    linkedin) =>
                buildPage(about, works, education, trivia, skills, phone, mail,
                    linkedin)),
            orElse: () {
              BlocProvider.of<HomeBloc>(context).add(const HomeEvent.load());
              return const SizedBox();
            },
          );
        },
      ),
    );
  }

  Widget buildPage(
    ShortDescription about,
    List<ShortDescription> works,
    List<ShortDescription> education,
    List<String> trivia,
    List<SkillIcon> skills,
    AssetImage phone,
    AssetImage mail,
    AssetImage linkedin,
  ) =>
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: img.diamondBackground(),
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
              buildBody(about, works, education, skills, phone, mail, linkedin),
              Align(
                alignment: Alignment.bottomCenter,
                child: TriviaWidget(trivia: trivia),
              ),
            ],
          ),
        ),
      );

  buildBody(
    ShortDescription about,
    List<ShortDescription> works,
    List<ShortDescription> education,
    List<SkillIcon> skills,
    AssetImage phone,
    AssetImage mail,
    AssetImage linkedin,
  ) =>
      Scrollbar(
        controller: _scrollController,
        thickness: 20,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              IntroWidget(
                about: about,
                key: _home,
              ),
              SkillWidget(
                skills: skills,
                key: _skills,
              ),
              WorksWidget(
                works: works,
                key: _works,
              ),
              EducationWidget(
                education: education,
                key: _education,
              ),
              ContactsWidget(
                phone: phone,
                linkedin: linkedin,
                key: _contact,
              ),
            ],
          ),
        ),
      );
}
