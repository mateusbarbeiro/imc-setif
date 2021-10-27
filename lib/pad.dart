import 'package:flutter/material.dart';

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
    color: Colors.green.withBlue(120));

const TextStyle kValueStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 70);

const TextStyle kDescriptionStyle = TextStyle(fontSize: 20);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  const Home({Key? key}) : super(key: key);

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
                        buttonHeight: 40,
                        buttonWight: 40,
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
                        buttonHeight: 40,
                        buttonWight: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: RoundIconButton(
              label: "CALCULAR",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Results(),
                  ),
                );
              },
              buttonHeight: 50,
              buttonWight: 390,
            ),
          )
        ],
      ),
    );
  }
}

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: const Text('Resultado',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Normal",
                    style: kResultStyle,
                  ),
                  const Text(
                    "22.4",
                    style: kValueStyle,
                  ),
                  const Text(
                    "You have a normal body weight. Good job!",
                    style: kDescriptionStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: RoundIconButton(
              label: "CALCULAR NOVAMENTE",
              onPressed: () {
                Navigator.of(context).pop();
              },
              buttonHeight: 50,
              buttonWight: 390,
            ),
          )
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
