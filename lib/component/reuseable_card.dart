import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
//in other to able to refer to the name of this property in the constructor input,
// i added a set of curly braces.{
  ReusableCard({required this.colour, this.cardChild, this.onPress});

  //in other to be able to customize  a property in this class so that it does not have a static value,
  // i created a property below and initialized in the constructor above.
  final Color colour;
  //a property for the custom widget.
// i created this property so that widget can have a child
  final Widget? cardChild;
//i passed a function into the reusable card widget using a property with void function as a data type,
// by doing this i have upgraded my reuasbleCard to be able to respond to tap
  final  void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(

        //wrapped the container widget with a gesture detector widget so that the reusable card can perform that function
        child: cardChild,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          // i then substituted the property name 'colour' to the color property below
          color: colour,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
