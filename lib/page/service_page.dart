import 'package:flutter/material.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Online Customer\n        Service",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Container(

        child:Column(
            children: [
              Image.asset("assets/service.png"),
             TextButton(
                      onPressed:(){

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("尚未實作"),
                        ));
                      },
                      child: Image.asset('assets/1b.png'))
        ]
        ),
      ),
    );
  }
}
