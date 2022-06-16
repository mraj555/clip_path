import 'package:flutter/material.dart';

class MyClipPath3 extends StatefulWidget {
  const MyClipPath3({Key? key}) : super(key: key);

  @override
  _MyClipPath3State createState() => _MyClipPath3State();
}

class _MyClipPath3State extends State<MyClipPath3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ClipPath(
            child: Container(
              height: 300,
              width: 300,
              color: Colors.orange,
            ),
            clipper: MyCP3(),
          ),
        ),
      ),
    );
  }
}

class MyCP3 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
