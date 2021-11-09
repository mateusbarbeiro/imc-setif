import 'package:flutter/material.dart';
import 'package:imc_setif/constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key? key,
    this.label,
    this.icon,
    required this.onPressed,
    this.buttonHeight = 100,
    this.buttonWight = 100,
  }) : super(key: key);

  final String? label;
  final double buttonHeight;
  final double buttonWight;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon != null
          ? Icon(
              icon,
              color: Colors.white,
            )
          : Text(
              label ?? "",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: buttonWight,
        height: buttonHeight,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      fillColor: kHighlightColor,
      onPressed: onPressed,
    );
  }
}
