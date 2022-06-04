import 'package:flutter/material.dart';

class HelpDetailPage extends StatelessWidget {
  final String title;
  final String content;
 const  HelpDetailPage({ Key? key,required, required this.title, required this.content}): super(key: key);



  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Help Center"),
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left:20,top: 14),
                alignment: Alignment.centerLeft,
                child: Text(title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepOrangeAccent,
                    ))),
            Container(
                padding: EdgeInsets.only(left:16,top: 14),
                alignment: Alignment.centerLeft,
                child: Text(content,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ))),
          ],
        ));
  }
}
