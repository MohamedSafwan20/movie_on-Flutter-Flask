import 'package:flutter/material.dart';
import 'package:movie_on/config/colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(
          color: TEXT_COLOR,
          strokeWidth: 2.8,
        ));
  }
}
