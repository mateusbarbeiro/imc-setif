import 'package:flutter/material.dart';
import 'dart:math';

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);

const kMainColor = Color(0xFF0A0E21);
const kCardColor = Color(0xFF1D1E33);
const kHighlightColor = Color(0xFFEB1555);

final TextStyle kResultStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 22,
  color: Colors.green.withBlue(120),
);

const TextStyle kValueStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 70,
);

const TextStyle kDescriptionStyle = TextStyle(
  fontSize: 20,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: kMainColor,
        scaffoldBackgroundColor: kMainColor.withAlpha(250),
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
          thumbColor: kHighlightColor,
          activeTrackColor: Colors.white,
          inactiveTrackColor: Colors.grey,
          trackHeight: 1,
        ),
      ),
      home: const Home(),
    );
  }
}

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

class Calculator {
  Calculator({
    required this.height,
    required this.weight,
  });

  final int weight;
  final int height;

  late double _bmi;

  void calculate() {
    double res = weight / (pow(height / 100, 2));
    _bmi = res;
  }

  String getValue() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Acima do peso";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Abaixo do peso";
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return 'Você tem um peso acima do normal. Tente se exercitar mais.';
    } else if (_bmi >= 18.5) {
      return 'Você tem um peso normal. Parabéns.';
    } else {
      return 'Você tem um peso abaixo do normal. Você pode comer um pouco mais.';
    }
  }
}

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
