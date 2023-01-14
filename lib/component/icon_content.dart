import 'package:flutter/material.dart';
import '../constants.dart';


//this is the card content i refractor in other to be able to customize to the contents to be reusable
class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        SizedBox(
          height: kTextIconSpace,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
