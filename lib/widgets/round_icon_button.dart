import 'package:flutter/material.dart';
import 'package:imc_setif/constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
      decoration: BoxDecoration(
        color: kHighlightColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
