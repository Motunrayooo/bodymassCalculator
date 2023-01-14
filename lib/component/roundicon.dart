import 'package:flutter/material.dart';


//creating this widget so as to   customize and personalize  it from scratch
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;

  //creating a property so that it can be passed in the setsate fot the weight
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      shape: CircleBorder(

      ),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
          width: 56.0, height: 56.0),
    );
  }
}
