import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyClipPath2 extends StatefulWidget {
  const MyClipPath2({Key? key}) : super(key: key);

  @override
  _MyClipPath2State createState() => _MyClipPath2State();
}

class _MyClipPath2State extends State<MyClipPath2>
    with SingleTickerProviderStateMixin {
  late AnimationController _control;

  @override
  void initState() {
    super.initState();
    _control = AnimationController(
      value: 0.0,
      duration: Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
          animation: _control,
          builder: (BuildContext context, Widget? child) {
            return ClipPath(
              child: Container(
                height: size.height * 0.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.red,
                      Colors.orange,
                    ])),
              ),
              clipper: MyCP2(_control.value),
            );
          },
        ),
      ),
    );
  }
}

class MyCP2 extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;

  MyCP2(this.move);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
