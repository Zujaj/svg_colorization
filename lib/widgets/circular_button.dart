import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

/// A Custom Rounded [Container] widget.
class CircularButton extends StatelessWidget {
  final Color innerColor;
  final List<BoxShadow>? shadow;
  final GestureTapCallback? onTap;
  final Widget child;

  const CircularButton({
    Key? key,
    required this.innerColor,
    this.shadow,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(side: BorderSide(width: 0.533)),
      hoverColor: HexColor('#333333'),
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: innerColor,
          shape: BoxShape.circle,
          boxShadow: shadow,
        ),
        child: child,
      ),
    );
  }
}
