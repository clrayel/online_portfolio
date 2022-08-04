import 'package:flutter/material.dart';
import 'package:online_portfolio/modules/home/data/models/short_description.dart';
import 'package:online_portfolio/modules/home/data/models/skill_icon.dart';

class HomeData {
  final ShortDescription _aboutMe = ShortDescription(
    textColor: Colors.white,
    hasShadow: true,
    title: "Hi, I'm Carlos",
    body:
        "Computer Science student of the University of the Philippines, Los Baños. Mobile Developer with some experience in other fields such as ReactJS backend, MongoDB databases, and Python. I also happen to be an artist, a nerd, and a gamer!",
  );

  final List<ShortDescription> workExp = [
    ShortDescription(
      title: "Sprout Solutions Phil., Inc.",
      subtitle: "Intern",
      body: "Software Development Intern",
    )
  ];

  final List<ShortDescription> works = [
    ShortDescription(
        title: "Summary of Schedule",
        subtitle:
            "2022: Sprout Solutions Phil., Inc. - A weekly schedule summary module",
        body:
            "An Innov Sprint project I made while I was doing internship in Sprout Solutions!",
        textColor: Colors.white,
        hasShadow: true,
        alignLeft: true),
    ShortDescription(
        title: "KALATAS",
        subtitle: "2022 - General Weighted Average Verifier for UPLB",
        body:
            "CMSC 128 group project wherein I am a Team Leader and a Programmer of the Database team. I co-authored the database API that our backend team used.",
        textColor: Colors.white,
        hasShadow: true,
        alignLeft: true),
    ShortDescription(
        title: "Periodic Visionary",
        subtitle: "2021 - Science blog project",
        body:
            "SCI 10 Earth Science blog on the future of the elements of the periodic table. It is, however, developed for free using only the UI of wordpress and not programmaticaly. web: https://periodicvisionary.wordpress.com/",
        textColor: Colors.white,
        hasShadow: true,
        alignLeft: true),
    ShortDescription(
        title: "Deliverance",
        subtitle: "2018 - Grade 11 video game project",
        body:
            "My first project. A turn-based console video game built in C# that incorporates heavy use of ASCII graphics and sound. It is in the form of a single boss fight that takes inspiration from Undertale.",
        textColor: Colors.white,
        hasShadow: true,
        alignLeft: true),
  ];

  final List<String> trivia = [
    "I like writing stories and drawing them!",
    "I once joined the Arnis club. On my first tournament, I blistered my hands! It was fun.",
    "I play the violin and the piano, but I prefer the violin.",
    "I like manga, anime, and web fiction!",
  ];

  final List<ShortDescription> education = [
    ShortDescription(
        title:
            "3rd Year BS Computer Science - University of the Philippines, Los Baños.",
        subtitle: "2019 (Ongoing)",
        body: "Los Baños, Laguna."),
    ShortDescription(
        title: "Senior High - Ateneo de Manila Senior High School",
        subtitle: "2017-2019",
        body: "Quezon City, Metro Manila"),
    ShortDescription(
        title: "Junior High - Ateneo de Manila Junior High School",
        subtitle: "2013-2017",
        body: "Quezon City, Metro Manila"),
    ShortDescription(
        title: "Elementary - Claret School of Quezon City",
        subtitle: "2008-2013",
        body: "Quezon City, Metro Manila"),
  ];

  final List<SkillIcon> skills = [
    SkillIcon(
      'graphics/skill_icon/python.png',
      'Python',
    ),
    SkillIcon(
      'graphics/skill_icon/javascript.png',
      'Javascript',
    ),
    SkillIcon(
      'graphics/skill_icon/flutter.png',
      'Flutter',
    ),
    SkillIcon(
      'graphics/skill_icon/c.png',
      'C',
    ),
    SkillIcon(
      'graphics/skill_icon/c-sharp.png',
      'C#',
    ),
    SkillIcon(
      'graphics/skill_icon/mongodb.png',
      'MongoDB',
    ),
    SkillIcon(
      'graphics/skill_icon/github.png',
      'Github',
    ),
  ];

  AssetImage phone = const AssetImage("graphics/contact_icon/phone.png");
  AssetImage mail = const AssetImage("graphics/contact_icon/mail.png");
  AssetImage linkedin = const AssetImage("graphics/contact_icon/linkedin.png");

  final String _python =
      "I have experience with designing UI and Artificial Intelligence in Python.";
  final String _javascript =
      "I have experience in creating React JS backends and connecting them to HTML/CSS frontends.";
  final String _flutter =
      "I have experience with designing UI and frontend functionalities in Flutter.";
  final String _c =
      "I have experience in working with data structures and threads in C.";
  final String _cSharp =
      "I have experience with creating a CLI Console game in C#.";
  final String _mongodb =
      "I have experience with working with MongoDB databases.";
  final String _github =
      "I have experience with working with repositories and collaborated development in Github.";

  getAbout() => _aboutMe;

  getSkillDir(String skill) {
    if (skill == "Python") return _python;
    if (skill == "Javascript") return _javascript;
    if (skill == "Flutter") return _flutter;
    if (skill == "C") return _c;
    if (skill == "C#") return _cSharp;
    if (skill == "MongoDB") return _mongodb;
    if (skill == "Github") return _github;
    return "No skill selected";
  }
}
