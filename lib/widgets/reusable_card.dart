import 'package:flutter/material.dart';
import 'package:imc_setif/constants.dart';

class ReusableCard extends StatelessWidget {
  final Widget cardChild;

  const ReusableCard({
    Key? key,
    required this.cardChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kCardColor,
      ),
    );
  }
}
