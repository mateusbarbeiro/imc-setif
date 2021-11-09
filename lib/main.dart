import 'package:flutter/material.dart';
import 'package:imc_setif/constants.dart';
import 'package:imc_setif/screens/home.dart';

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
