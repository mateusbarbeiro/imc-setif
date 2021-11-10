import 'package:flutter/material.dart';
import 'package:imc_setif/constants.dart';

class RoundTextButton extends StatelessWidget {
  const RoundTextButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: kHighlightColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: double.infinity,
      height: 50.0,
    );
  }
}
