import 'package:flutter/material.dart';

class BackgroundTop extends StatelessWidget {

  final Widget child;

  const BackgroundTop({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
                "assets/top1.png",
                width: size.width
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
                "assets/top2.png",
                width: size.width
            ),
          ),
        ],
      ),
    );
  }
}
