import 'package:flutter/material.dart';

class BulletWidget extends StatelessWidget {
  final Color color;

  const BulletWidget(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
