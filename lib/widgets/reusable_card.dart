import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Function? onPressed;
  final Color color;
  final Widget cardChild;

  const ReusableCard({
    Key? key,
    required this.color,
    required this.cardChild,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed != null ? onPressed!() : null;
      },
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}
