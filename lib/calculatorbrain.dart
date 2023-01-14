//to use an exponential
import 'dart:math';

class CalculatorBrain {

 CalculatorBrain({required this.weight, required this.height});

  final int weight;
  final int height;




  double? _bmi;
 String calculateBMI() {
//the operation i want it to perform
//to convert cm to m, i divided it by 100
   _bmi = weight / pow(height / 100, 2);
  return _bmi!.toStringAsFixed(1);
 }

 String getResult() {
  if (_bmi! >= 25) {
   return 'OVERWEIGHT!';
  }
  else if (_bmi! > 18.5) {
   return 'NORMAL!';
  }
  else {
   return 'UNDERWEIGHT!';
  }
 }

String getInterpretation(){
 if (_bmi! >= 25) {
  return 'You should exercise more';
 }
 else if (_bmi! > 18.5) {
  return 'Good for you, Just Maintain this with healthy eating';
 }
 else {
  return 'You should eat more';
 }
}

}