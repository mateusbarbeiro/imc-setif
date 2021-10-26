import 'package:flutter/material.dart';
import 'package:imc_setif/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        backgroundColor: Colors.purple.shade200,
        sliderTheme: SliderTheme.of(context).copyWith(
          inactiveTrackColor: Colors.purple.shade200,
          activeTrackColor: Colors.purple.shade600,
          thumbColor: Colors.purple.shade700,
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 15.0,
          ),
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 30.0,
          ),
          overlayColor: Colors.purple.shade300,
        ),
      ),
      home: const Home(),
    );
  }
}
