import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/icon_content.dart';
import '../component/reuseable_card.dart';
import '../constants.dart';
import '../component/roundicon.dart';
import 'results_page.dart';
import '../component/bottombutton.dart';
import 'package:bmi_calculator/calculatorbrain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //this variable is for holding a gender value
  Gender? selectedGender;
  int height = 180;

  int weight = 60;
  int age = 0;

  void add() {
    setState(() {
      weight++;
    });
  }

  void subtract() {
    setState(() {
      weight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //the center widget is to align the appbar title
          title: Center(
            child: Text('BMI CALCULATOR'),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      // i added the function onPress of the reusable function as a property
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kColourCardActive
                          : kColourCardInActive,

                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label:
                            'MALE', //ToDO: create an easier way to make changes to this property
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      // this is just like initializing the reusable class constructor  property onPress
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },

                      //check if the gender selected is female,
                      // if yes change card color to active. if it is not selected it should be inactive color card
                      colour: selectedGender == Gender.female
                          ? kColourCardActive
                          : kColourCardInActive,

                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kNumberStyle),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Color(0xFFFFFFFF),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29EB1555),
                      ),
                      //i want to make changes to the slider, so what i did above simply means i used the
                      // default value of the silder, but i want to customize it a bit that is why i used this '.of(context)'
                      // so to tap into the specific property i want to customize, i used the .copywith()
                      child: Slider(
                        value: height.toDouble(),
                        //this is the scale for the height
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          //the new value is to update the physical appearance of the slider
                          // ie to kmow when the value starts to change

                          setState(() {
                            height = newValue.round();
                          });
                          // i used the .round to convert the double to int
                          //the newValue will be the value that will be passed to us from
                          // the slider when the user drags the button
                        },
                      ),
                    ),
                    //the value of how slider is going to be the height that the user select
                  ],
                ),
                colour: kColourCardActive,
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: subtract,
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: add,
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kColourCardActive,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(age.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                    colour: kColourCardActive,
                  ),
                ),
              ],
            )),
            BottomButton(
                onTap: () {
                  // created an object for the calculator brain and initialized it
                  CalculatorBrain cal =
                      CalculatorBrain(weight: weight, height: height);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                                bmiResult: cal.calculateBMI(),
                                resultText: cal.getResult(),
                                interpretation: cal.getInterpretation(),
                              )));
                },
                buttonButtonTag: 'CALCULATE'),
          ],
        ));
  }
}
