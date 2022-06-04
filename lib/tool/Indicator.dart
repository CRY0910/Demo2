import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int currentIndex;
  final int dotCount;
  final ValueChanged onItemTap;

  final Color dotColor;
  final Color dotSelectedColor;
  final double dotSize;
  final double dotPadding;

  Indicator({
    Key? key,
    required this.currentIndex,
    required this.dotCount,
    required this.onItemTap,
    required this.dotColor,
    required this.dotSelectedColor,
    required this.dotSize,
    required this.dotPadding,
  }) : super(key: key);

  Widget _renderItem(int index) {
    var color =
        currentIndex == index ? dotColor : dotSelectedColor;
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(dotPadding),
        child: Container(
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
      onTap: () {
        this.onItemTap(index);
      },
    );
  }

  double getWidth() {
    return dotSize * dotCount + this.dotPadding * (dotCount + 5);
  }

  double getHeight() {
    return dotSize + dotPadding * 2;
  }

  Widget _getItems() {
    return Container(
      child: ListView.builder(
        itemCount: this.dotCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _renderItem(index);
        },
      ),
      width: this.getWidth(),
      height: this.getHeight(),
    );
  }

  @override
  build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // transparent black background
        Container(
          height: this.getHeight(),
          color: Color.fromRGBO(0, 0, 0, 0.6),
        ),

        // dot list
        Container(
          child: _getItems(),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
