
import 'package:demo2/tool/radio_option.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  LanguagePageState createState() => LanguagePageState();
}

class LanguagePageState extends State<LanguagePage> {
  String lang = "Language Settings";
  String? _groupValue='1';

  // ValueChanged<String?> _valueChangedHandler() {
  //   return (value) => setState(() => _groupValue = value!);
  // }


  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(lang),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            MyRadioOption<String>(
              value: '1',
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value!;
                  lang = "Language Settings";
                });
              },
              label: '1',
              text: 'English',
            ),
            MyRadioOption<String>(
              value: '2',
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value!;
                  lang = "语言设置";
                });
              },
              label: '2',
              text: '简体中文',
            ),
            MyRadioOption<String>(
              value: '3',
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value!;
                  lang = "語言設置";
                });
              },
              label: '3',
              text: '繁體中文',
            ),
          ],
        ));
  }
}
