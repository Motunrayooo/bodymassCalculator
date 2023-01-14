import 'package:flutter/material.dart';
import '../constants.dart';
import '../component/reuseable_card.dart';
import '../component/bottombutton.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

final String bmiResult;
final String resultText;
final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment:  CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kTheTittleStyle,
              ),
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
            ),
          ),

          Expanded(
            flex: 5,

            child: ReusableCard(
              colour:kColourCardActive,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(),
                  style: kMiddleCardLabel),

                  Text(bmiResult,
                  style: kDigitResultStyle,),

                  Text(interpretation,
                  textAlign: TextAlign.center,
                  style: kResultComment,
                  ),
                ],
              ),
            ),

          ),
        BottomButton(buttonButtonTag: 'RE-CALCULATE',
          onTap: () {
          Navigator.pop(context);
          },
        ),
        ],
      ),
    );
  }
}
