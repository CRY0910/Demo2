import 'package:demo2/data/CurrencyInfo.dart';
import 'package:demo2/page/detail_page.dart';
import 'package:demo2/page/finance_page.dart';
import 'package:demo2/page/help_page.dart';
import 'package:demo2/page/language_page.dart';
import 'package:demo2/page/service_page.dart';
import 'package:demo2/tool/marquee.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

var images = [
  'assets/b1.png',
  'assets/b2.png',
  'assets/b3.png',
];

final List<String> imgList = [
  'assets/1b.png',
  'assets/2b.png',
  'assets/3b.png'
];

final List<String> titleList = <String>[
  'BTC/USDT',
  'ETH/USDT',
  'BNB/USDT',
  'XRP/USDT',
  'DOGE/USDT',
  'LUNA/USDT',
  'EOS/USDT',
  'ADA/USDT',
  'TRX/USDT',
  'XMR/USDT',
  'DASH/USDT',
  'LTC/USDT',
  'OMG/USDT',
  'ETC/USDT',
  'USDC/USDT'
];

final List<String> priceList = <String>[
  '30470.32',
  '1820.22',
  '306.7',
  '0.40719',
  '0.082508',
  '6.9089',
  '1.2869',
  '0.58965',
  '0.085005',
  '199.04',
  '58.86',
  '64.27',
  '2.5168',
  '22.4163',
  '1.0008'
];
final List<String> btnList = <String>[
  '0.82',
  '0.12',
  '0.96',
  '1.74',
  '0.70',
  '3.43',
  '0.75',
  '0.11',
  '-0.06',
  '-0.60',
  '-1.08',
  '0.77',
  '0.39',
  '1.25',
  '-0.01'
];

final List<bool> statusList = <bool>[
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  false,
  false,
  false,
  true,
  true,
  true,
  false
];

final List<Widget> imageSliders = imgList
    .map((item) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(item),
          ],
        )))
    .toList();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // generate dummy data to feed the second SliverGrid
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBarWidget(),
      body: Center(
          child: Container(
        color: Colors.white60,
        child: SizedBox(
            height: Axis.vertical == Axis.vertical ? double.infinity : 210.0,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                    child: Stack(children: [
                  CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                        aspectRatio: 2.8,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 0, top: 110, right: 0, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 6.0,
                            height: 6.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.white)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ])),
                //跑馬燈
                SliverToBoxAdapter(
                  child: Card(
                      child: Container(
                    height: 20,
                    padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                    child: Row(children: <Widget>[
                      const Icon(Icons.add_alert, size: 14),
                      MarqueeSingle(
                          child: Container(
                              color: Colors.white,
                              width: 300,
                              child: const Text(
                                  'this is a short text with long width'))),
                      const Spacer(),
                      InkWell(
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: const Icon(Icons.keyboard_arrow_right, size: 14)),
                        onTap: () {},
                      ),
                    ]),
                  )),
                ),
                //3個幣別概況
                SliverGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.5,
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(6, 2, 0, 0),
                        child: Card(
                            child: Container(
                                padding: const EdgeInsets.fromLTRB(6, 6, 0, 0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6, 0, 0),
                                        child: Row(children: <Widget>[
                                          const Text('BTC',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold)),
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                6, 0, 0, 0),
                                            child: const Text('/USDT',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                6, 0, 0, 0),
                                            child: const Text('-2.74%',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 10.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ])),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6, 0, 0),
                                        child: const Text('31177.01',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold))),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 4, 0, 0),
                                        child: const Text('≈\$31177.01',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)))
                                  ],
                                )))),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                        child: Card(
                            child: Container(
                                padding: const EdgeInsets.fromLTRB(6, 6, 0, 0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6, 0, 0),
                                        child: Row(children: <Widget>[
                                          const Text('ETH',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold)),
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                6, 0, 0, 0),
                                            child: const Text('/USDT',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                6, 0, 0, 0),
                                            child: const Text('-3.99%',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 10.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ])),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6, 0, 0),
                                        child: const Text('1909.25',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold))),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 4, 0, 0),
                                        child: const Text('≈\$1909.25',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)))
                                  ],
                                )))),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 6, 0),
                        child: Card(
                            child: Container(
                                padding: const EdgeInsets.fromLTRB(6, 6, 0, 0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6, 0, 0),
                                        child: Row(children: <Widget>[
                                          const Text('BNB',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold)),
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                6, 0, 0, 0),
                                            child: const Text('/USDT',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                6, 0, 0, 0),
                                            child: const Text('-2.53%',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 10.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ])),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6, 0, 0),
                                        child: const Text('313.25',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold))),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 4, 0, 0),
                                        child: const Text('≈\$313.25',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)))
                                  ],
                                )))),
                  ],
                ),
                //Service,Settings
                SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 2.0,
                  childAspectRatio: 3,
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(6, 2, 6, 0),
                        child: GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ServicePage(),
                                    ),
                                  )
                                },
                            child: Card(
                                child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 6, 14, 0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.add_call),
                                        const Spacer(),
                                        const Text("Online Customer\n      Service")
                                      ],
                                    ))))),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 2, 6, 0),
                      child: GestureDetector(
                          onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LanguagePage(),
                                  ),
                                )
                              },
                          child: Card(
                              child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(6, 6, 14, 0),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.account_tree),
                                      Spacer(),
                                      Text("Language Settings")
                                    ],
                                  )))),
                    )
                  ],
                ),

                SliverGrid.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 3,
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                          child: Card(
                            child: Image.asset("assets/banner1.png"),
                          ))
                    ]),
                //Financial ,Help
                SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 2.0,
                  childAspectRatio: 3,
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(6, 2, 6, 0),
                        child: GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FinancePage(),
                                    ),
                                  )
                                },
                            child: Card(
                                child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 6, 14, 0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.account_balance),
                                        Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                36, 0, 0, 0),
                                            child: const Text("Financial\nManagement",
                                                textAlign: TextAlign.center))
                                      ],
                                    )))
                        )
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 2, 6, 0),
                        child: GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HelpPage(),
                                    ),
                                  )
                                },
                            child: Card(
                                child: Container(
                                    padding: const EdgeInsets.fromLTRB(6, 6, 14, 0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.accessible_outlined),
                                        Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                36, 0, 0, 0),
                                            child: const Text("Help Center"))
                                      ],
                                    ))))),
                  ],
                ),

                SliverGrid.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 3,
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                          child: Card(
                            child: Image.asset("assets/banner2.png"),
                          ))
                    ]),

                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                      child: Column(children: [
                        const SizedBox(height: 5),
                        Row(children: [
                          Column(children: [
                            Container(
                                padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
                                child: Text(titleList[index],
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ))),
                            Container(
                                padding: const EdgeInsets.fromLTRB(16, 4, 0, 0),
                                child: const Text("Trading volume",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ))),
                          ]),
                          Container(
                            padding:const EdgeInsets.fromLTRB(100, 0, 0, 0),
                            child: Column(children: [
                              Text(priceList[index],
                                  style:  TextStyle(
                                    fontSize: 14,
                                    color:statusList[index]? Colors.green: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Container(
                                  padding:const EdgeInsets.fromLTRB(0, 4, 0, 0),
                                  child: Text("≈\$${priceList[index]}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ))),
                            ]),
                          ),
                          const Expanded(child: SizedBox()),
                          Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.fromLTRB(0, 4, 10, 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:statusList[index]? Colors.green: Colors.red,
                                ),
                                onPressed: () {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(currencyInfo: CurrencyInfo(titleList[index], priceList[index], priceList[index],btnList[index])),
                                    ),);
                                },
                                child:  Text(btnList[index],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    )),
                              )),
                        ]),
                        const SizedBox(height: 5),
                        const Divider()
                      ])
                  , onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => DetailPage(currencyInfo: CurrencyInfo(titleList[index], priceList[index], priceList[index],btnList[index])),
                      ),);

                      },

                  );
                }, childCount: titleList.length)),

                // Just add some padding
                const SliverPadding(padding: EdgeInsets.symmetric(vertical: 2)),
              ],
            )),
      )),
    );
  }
}

class GetAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/star.png',
            fit: BoxFit.contain,
            height: 32,
          ),
          Container(padding: const EdgeInsets.all(8.0), child: const Text('Star'))
        ],
      ),
      elevation: 0.0, //shade
    );
  }

  const GetAppBarWidget({Key? key}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);

  Size getSize() {
    return const Size(100.0, 100.0);
  }
}
