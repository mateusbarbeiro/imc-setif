import 'package:flutter/material.dart';
import 'package:imc_setif/constants.dart';
import 'package:imc_setif/widgets/reusable_card.dart';
import 'package:imc_setif/widgets/round_text_button.dart';

class Results extends StatelessWidget {
  const Results({
    Key? key,
    required this.result,
    required this.value,
    required this.description,
  }) : super(key: key);

  final String result;
  final String value;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 15,
            ),
            child: const Text(
              'Resultado',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: kResultStyle,
                  ),
                  Text(
                    value,
                    style: kValueStyle,
                  ),
                  Text(
                    description,
                    style: kDescriptionStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: RoundTextButton(
              label: "CALCULAR NOVAMENTE",
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
