import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Background extends StatelessWidget {

  final Widget child;

  const Background({
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
          Positioned(
            top: 5.h,
            left: 3.w,
            child: Image.asset(
                "assets/logo.png",
                width: size.width * 0.35
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
                "assets/bottom1.png",
                width: size.width
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
                "assets/bottom2.png",
                width: size.width
            ),
          ),
          child
        ],
      ),
    );
  }
}
