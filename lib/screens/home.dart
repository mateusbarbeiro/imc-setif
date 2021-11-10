import 'package:flutter/material.dart';
import 'package:imc_setif/brain/calculator.dart';
import 'package:imc_setif/constants.dart';
import 'package:imc_setif/screens/results.dart';
import 'package:imc_setif/widgets/reusable_card.dart';
import 'package:imc_setif/widgets/round_icon_button.dart';
import 'package:imc_setif/widgets/round_text_button.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int height = 120;
  int weight = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'ALTURA',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'PESO',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        "kg",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: Icons.add,
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      RoundIconButton(
                        icon: Icons.remove,
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: RoundTextButton(
              label: "CALCULAR",
              onPressed: () {
                var calc = Calculator(
                  height: height,
                  weight: weight,
                );
                calc.calculate();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Results(
                      result: calc.getResult(),
                      value: calc.getValue(),
                      description: calc.getDescription(),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
