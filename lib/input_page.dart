import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_button.dart';
import 'calculator_brain.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'results_page.dart';
import 'reusable_card.dart';
import 'round_icon_button.dart';

// define the constant value easier to modify
// const bottomContainerHeight = 80.0;
// const activeCardColor = Color(0xFF1D1E33);
// const inactiveCardColor = Color(0xFF111328);
// const bottomContainerColor = Color(0xFFEB1555);
// 枚举法 把所有的可能性编辑成一个class
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 80;
  int age = 20;

  get fontSize => null;

  // *************** IMPORTANT ************** //
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  // 1 = male, 2 = female
  // 原代码：
  // void updateColor(int gender) {
  // // male card pressed
  //     if (selectedGender == Gender.male) {
  //       if (maleCardColor == inactiveCardColor) {
  //         maleCardColor = activeCardColor;
  //         // male = selected meaning female - unselected
  //         femaleCardColor = inactiveCardColor;
  //       } else
  //         maleCardColor = inactiveCardColor;
  //     }
  //     // female card pressed
  //     if (selectedGender == Gender.female) {
  //       if (femaleCardColor == inactiveCardColor) {
  //         femaleCardColor = activeCardColor;
  //         maleCardColor = inactiveCardColor;
  //       } else
  //         femaleCardColor = inactiveCardColor;
  //     }
  //   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(
          // 因为系统自定义的是当无child property的时候，card自动stretch到了整页屏幕
          // 例如第三个widget，但填充了"HEIGHT"的时，card会缩减至"HEIGHT"的长度
          // 解决的方案就是如下行的code
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Expanded widget to ensure the size
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    // ****IMPORTANT******  =>>> Ternary Operator
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  // ****IMPORTANT******  =>>> Ternary Operator
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                )),
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  SizedBox(
                    height: 13.0,
                  ),
                  Row(
                    // mainAxisAlignment is horizontal modify the display
                    // crossAxisAlignment is vertical modify the display
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        // instead of hard code '180' here, we use the folloing
                        // convert to the string property
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  // ************************ IMPORTANT ********************* //
                  // MEMORY THE SLIDER GENERAL FUNCTION
                  SliderTheme(
                    //  By doing this, can only modify some properties
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFEB1555),
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      thumbColor: Color(0XFFEB1555),
                      overlayColor: Color(0X29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 8.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      label: '$height',
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            )),

            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'kg',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          // Giving Spaces between two buttons
                          SizedBox(
                            width: 8.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'y.o.',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          // Giving Spaces between two buttons
                          SizedBox(
                            width: 8.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            )),

            //***************** IMPORTANT ***************************
            // NAVIGATOR THE PAGE
            // Click the "calculate" to navigator the next page
            //  GestureDetector(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => ResultsPage()));
//               },
//               child: Container(
//                 child: Center(
//                     child: Text('CALCULATE', style: kLargeButtonTextStyle)),
//                 color: kBottomContainerColor,
//                 margin: EdgeInsets.only(top: 10.0),
//                 width: double.infinity,
//                 // *** Scratch to the full screen
//                 // Move the text "CALCULATE" up a bit
//                 padding: EdgeInsets.only(bottom: 20.0),
//                 height: kBottomContainerHeight,
//               ),
//             ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: (height), weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
            ),
          ],
        ));
  }
}

//         floatingActionButton: Theme(
//         // data: ThemeData.light(),
//         data: ThemeData(accentColor: Colors.purple),
//         child: FloatingActionButton(
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
