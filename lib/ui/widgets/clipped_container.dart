
import 'package:camera_app/ui/values/values.dart';
import 'package:flutter/material.dart';

class ClippedContainer extends StatelessWidget {
  const ClippedContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppBarClipper(),
      child: Container(
              height: CUSTOM_APP_BAR_HEIGHT + MediaQuery.of(context).padding.top ,
              decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pg_top.png', ),
                fit: BoxFit.cover,
              ),  
          ),
      ),
    );
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    final double curve = 35;

    path.lineTo(0, size.height);

    Offset point01 = Offset(size.width / 4, size.height - curve);
    Offset point02 = Offset(size.width / 2, size.height - curve);

    path.quadraticBezierTo(point01.dx, point01.dy, point02.dx, point02.dy);

    Offset point03 = Offset(3 * size.width / 4, size.height - curve);
    Offset point04 = Offset(size.width, size.height);

    path.quadraticBezierTo(point03.dx, point03.dy, point04.dx, point04.dy);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
