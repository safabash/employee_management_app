import 'package:flutter/material.dart';

class TopClip extends StatelessWidget {
  const TopClip({
    super.key,
    required this.size,
    required this.height,
    required this.color,
    this.clipper,
  });

  final Size size;
  final double height;
  final Color? color;
  final CustomClipper<Path>? clipper;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper,
      child: Container(
        height: height,
        width: size.width,
        color: color,
      ),
    );
  }
}

class BottomClip extends StatelessWidget {
  const BottomClip({
    super.key,
    required this.size,
    required this.height,
    this.color,
    this.clipper,
  });

  final Size size;
  final double height;
  final Color? color;
  final CustomClipper<Path>? clipper;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        child: ClipPath(
          clipper: clipper,
          child: Container(
            height: height,
            width: size.width,
            color: color,
          ),
        ));
  }
}