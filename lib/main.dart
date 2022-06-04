
import 'package:demo2/page/mine_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'page/assets_page.dart';
import 'page/home_page.dart';
import 'page/quotes_page.dart';
import 'page/trade_page.dart';

void main() {
  runApp(const MyApp());
}

const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: white,
      ),

      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  //const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>const BottomNavigationController())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}



class BottomNavigationController extends StatefulWidget {
  const BottomNavigationController({Key? key}) : super(key: key);

  @override
  BottomNavigationControllerState createState() =>
      BottomNavigationControllerState();
}

class BottomNavigationControllerState
    extends State<BottomNavigationController> {
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值
  final pages = [const HomePage(), const QuotesPage(), const TradePage(),const  AssetsPage(),const MinePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const GetAppBarWidget(),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_chart),  label:'Quotes'),
          BottomNavigationBarItem(icon: Icon(Icons.add_business),  label:'Trade'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance),  label:'Assets'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),  label:'Mine'),
        ],
        currentIndex: _currentIndex, //目前選擇頁索引值
        fixedColor: Colors.orange, //選擇頁顏色
        onTap: _onItemClick, //BottomNavigationBar 按下處理事件
      ),
    );
  }

  //BottomNavigationBar 按下處理事件，更新設定當下索引值
  void _onItemClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}








class SecondScreenPage extends StatefulWidget {
  const SecondScreenPage({Key? key}) : super(key: key);

  //const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<SecondScreenPage> createState() => _SecondScreenPageState();
}

class _SecondScreenPageState extends State<SecondScreenPage> {
  final List<Widget> _items = [
    const Text(
      'Index 0: Home',
    ),
    const Text(
      'Index 1: Profile',
    ),
    const Text(
      'Index 2: Shop',
    ),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const GetAppBarWidget(),
      body:Center(
          child: IndexedStack(
              index: _selectedIndex,
              children: _items
          )//_items.elementAt(_index),
      ),
      bottomNavigationBar: _showBottomNav(),
    );
  }

  Widget _showBottomNav()
  {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Shop',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
    );
  }


  void _onTap(int index)
  {
    _selectedIndex = index;
    setState(() {

    });
  }

}







class GetAppBarWidget extends StatelessWidget implements PreferredSizeWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      centerTitle: true,
      title:  const Text("BOX"),
      elevation: 0.0, //shade
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => {},
        ),
        IconButton(
          icon: const Icon(Icons.supervisor_account),
          onPressed: () => {},
        ),
      ],
    );
  }



  const GetAppBarWidget({Key? key}) :super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);


  Size getSize() {
    return const Size(100.0, 100.0);
  }
}

