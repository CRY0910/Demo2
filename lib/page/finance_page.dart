import 'package:flutter/material.dart';

class FinancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          centerTitle: true,
          title: Text("Financial Management"),
          backgroundColor: Colors.blueAccent,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text("待完成"),
      ),
    );
  }
}
