import 'package:demo2/page/help_detail_page.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Help Center"),
        elevation: 0,
      ),
      body: ListView(

        children: <Widget>[
          SizedBox(
            height: 60,
          child:ListTile(

            title: const Text('What is frozen assets?'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpDetailPage(title: "What is frozen assets?",content: ".Frozen assets means that when you perform a\ntransaction or withdrawal operation,the process"
                      "\nhas not been completed,and the current assets\nare temporarily managed by the system,and you"
                      "\ncannot manage them freely.It does not mean\nthat you have lost the asset or that the asset is\nabnormal"
                      ",please rest assured."),
                ),);
            },
          )),

          const Divider(),
         SizedBox(
          height: 60,
             child:ListTile(
            title: const Text('Why does the converted amount assets\nChange?'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpDetailPage(title: "Why does the converted amount\nassets Change?",content: "The equivalent calculation in the asset is tha"
                      "\nvalue of the current holding digitl currency\nconverted into USDT,whinchchanges due to the\nprice fluctuatiob of the digital.The number of\n"
                      "your digital assets has not changed"),
                ),);
            },
          )),
          const Divider(),
          SizedBox(
              height: 60,
              child:ListTile(
                title: const Text('Forgot the funds password processing \nmethhod for platform transactions'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpDetailPage(title: "Forgot the funds password\nprocessing methhod for platform\ntransactions",content: "If you forget the trading fud password on the"
                          "\nplatform please go to 'My-Settings-Click Set\nfund password \" orcontact customer service to\nreset"),
                    ),);
                },
              )),
          const Divider(),
          SizedBox(
              height: 60,
              child:ListTile(
                title: const Text('Where is the captital flow after transaction purchase?'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpDetailPage(title: "Where is the captital flow after\ntransaction purchase?",content: "After the purchase order is completed,the fund\n"
                          "will go to the fiat account in the asset.If you\nneed to purchase assets for contract\n"
                          "transactions or capital transactions,please go\nto the transfer module to transfer."),
                    ),);
                },
              )),
          const Divider(),
          SizedBox(
              height: 60,
              child:ListTile(
                title: const Text('Why limmit the mumber of changes\ntonicknames'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpDetailPage(title: "Why limmit the mumber of changes\ntonicknames",content: "For the safety of your transactions,the current\n"
                          "limit of leagues can only be modified once."),
                    ),);
                },
              )),
          const Divider(),
          SizedBox(
              height: 60,
              child:ListTile(
                title: const Text('What do you mean when you transfer?Why\ndo you need to transfes'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpDetailPage(title: "What do you mean when you\ntransfer?Why do you need to\ntransfes",content: "In Order to ensure the rationality of the funds\n"
                          "between the books and facilitate your asset\ncontrol risk,we hereby divide the books of each\nmajor transaction."),
                    ),);
                },
              )),
          const Divider(),
        ],
      )
    );
  }
}
