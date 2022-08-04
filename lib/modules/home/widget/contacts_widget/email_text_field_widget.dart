import 'package:flutter/material.dart';

import '../../../../core/text_style/text_styles.dart';
import '../../data/models/email_model.dart';
import 'white_text_field_widget.dart';

class EmailTextField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController subject;
  final TextEditingController body;
  const EmailTextField(
      {Key? key,
      required this.formKey,
      required this.name,
      required this.email,
      required this.subject,
      required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: WhiteTextFieldWidget(
                    controller: name,
                    hintText: "Name",
                  ),
                ),
                Expanded(
                  child: WhiteTextFieldWidget(
                    controller: email,
                    hintText: "Email",
                  ),
                ),
              ],
            ),
            WhiteTextFieldWidget(
              controller: subject,
              hintText: "Subject",
            ),
            WhiteTextFieldWidget(
              controller: body,
              hintText: "Body",
              lines: 5,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Email mail = Email(
                      name: name.text,
                      email: email.text,
                      subject: subject.text,
                      body: body.text,
                    );
                    name.clear();
                    email.clear();
                    subject.clear();
                    body.clear();
                    print("From " + mail.name + " - " + mail.email);
                    print("Subject - " + mail.subject);
                    print(mail.body);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Sending Email...")),
                    );
                    const Duration(seconds: 2);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Email sent!")),
                    );
                  }
                },
                child: Text(
                  "Send",
                  style: getHeader1Style(Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
