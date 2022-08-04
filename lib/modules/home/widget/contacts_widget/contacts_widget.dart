import 'dart:html' as html;

import 'package:flutter/material.dart';

import '../../../../core/home_data/home_data.dart';
import '../../../../core/text_style/text_styles.dart';
import 'email_text_field_widget.dart';

class ContactsWidget extends StatelessWidget {
  ContactsWidget({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _body = TextEditingController();

  HomeData data = HomeData();
  double? fontSize = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      color: Colors.black.withOpacity(0.8),
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Contact Me!",
            style: getTitleStyle(Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmailTextField(
                    formKey: _formKey,
                    name: _name,
                    email: _email,
                    subject: _subject,
                    body: _body),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    iconTextPair(data.phone, "+639983412995"),
                    iconTextPair(data.linkedin, "LinkedIn",
                        "https://ph.linkedin.com/in/carlos-angelo-rayel-413722237"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget iconTextPair(AssetImage image, String text, [String link = ""]) =>
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                if (link.isEmpty) return;
                html.window.open(
                  link,
                  'new tab',
                );
              },
              icon: ImageIcon(
                image,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: getBodyStyle(Colors.white),
            ),
          ],
        ),
      );
}
