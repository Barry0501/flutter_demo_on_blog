import 'package:flutter/material.dart';

class HeartBrokenWidget extends StatelessWidget {
  const HeartBrokenWidget({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: Icon(
        Icons.heart_broken_rounded,
        color: Colors.red,
        size: size,
      ),
    );
  }
}
