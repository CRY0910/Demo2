import 'package:flutter/material.dart';
import 'Indicator.dart';

class Carousel extends StatefulWidget {
  final List<String> imagePaths;
  final double height;

  const Carousel({Key? key,
    required this.imagePaths,
    required this.height,
  }) : super(key: key);

  @override
  CarouselState createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  PageController pageController = PageController();
   late PageView pageView;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageView = PageView.builder(
      itemCount: widget.imagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return Image(
          image: AssetImage(widget.imagePaths[index]),
          fit: BoxFit.cover,
        );
      },
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      controller: pageController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: <Widget>[
          Container(
            child: pageView,
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: _getIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _getIndicator() {
    return Indicator(
      dotCount: widget.imagePaths.length,
      currentIndex: currentIndex,
      dotColor: const Color.fromRGBO(255, 255, 255, 1),
      dotSelectedColor: const Color.fromRGBO(255, 255, 255, 0.3),
      dotPadding: 12,
      dotSize: 14,
      onItemTap: (index) {
        pageController.jumpToPage(index);
      },
    );
  }


}