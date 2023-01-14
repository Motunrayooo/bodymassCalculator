import 'package:flutter/material.dart';
import 'screens/input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // THE .copywith enables us to tap into the themeData,dark() and also add other properties along side
    theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
            backgroundColor: Color( 0xFF090C22)),
      // in other to add a hex color to a
      // material app and make the color opaque, remove the # notation and
      // replace it with number zero and letters xFF.
        scaffoldBackgroundColor: Color(0xFF090C22),
        // textTheme: TextTheme(
        //   bodyText1: TextStyle(color: Colors.yellow
        //   )
        // )
      //this is the way to style a text body using theme
      //   textTheme: Theme.of(context).textTheme.apply(bodyColor: Color(0xFFFFFFFF),),

        // typography: Typography(
        //   white: TextTheme(
        //     bodyText1: TextStyle(
        //       color: Colors.white
        //     )
        //   )
        // ),
    ),
      home: InputPage(),
    );
  }
}

