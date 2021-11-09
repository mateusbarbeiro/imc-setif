import 'dart:math';

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
