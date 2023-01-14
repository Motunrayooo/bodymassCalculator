import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonButtonTag});

  late final String buttonButtonTag;
  late final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
              buttonButtonTag,
              style: kLargeButtonStyle),
        ),

        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          color: kBottomContainerColour,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
