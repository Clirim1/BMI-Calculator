import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/rezult_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'methods.dart';

Methods obj = Methods();

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

const boxColor = Color(0xFF1D1E33);
const box1Color = Color(0xFF111328);
enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: obj.makeCard(
                      selectedGender == Gender.male ? boxColor : box1Color,
                      obj.makeIcons('MALE', FontAwesomeIcons.mars), () {
                    setState(() {});
                    selectedGender = Gender.male;
                  }),
                ),
                Expanded(
                  child: obj.makeCard(
                      selectedGender == Gender.female ? boxColor : box1Color,
                      obj.makeIcons('FEMALE', FontAwesomeIcons.venus), () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  }),
                )
              ],
            ),
          ),
          Expanded(
            child: obj.makeCard(
                boxColor,
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: styleText1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(), style: styleText2),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'cm',
                            style: styleText1,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30.0,
                          ),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double value) {
                              setState(() {
                                height = value.round();
                              });
                            }),
                      )
                    ],
                  ),
                ),
                () {}),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: obj.makeCard(
                      boxColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: styleText1,
                          ),
                          Text(
                            weight.toString(),
                            style: styleText2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RowButtons(
                                icon: FontAwesomeIcons.minus,
                                function: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              RowButtons(
                                icon: FontAwesomeIcons.plus,
                                function: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      () {}),
                ),
                Expanded(
                  child: obj.makeCard(
                      boxColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: styleText1,
                          ),
                          Text(
                            age.toString(),
                            style: styleText2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RowButtons(
                                icon: FontAwesomeIcons.minus,
                                function: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RowButtons(
                                icon: FontAwesomeIcons.plus,
                                function: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      () {}),
                )
              ],
            ),
          ),
          BottomButton(
            'Calculate',
            () {
              CalculatorBrain calc = CalculatorBrain(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          calc.calculateBmi(),
                          calc.getResult(),
                          calc.getInterpretation(),
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton(this.text, this.onpres);

  final String text;
  final Function onpres;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpres,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
        width: double.infinity,
        height: 60.0,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Color(0xFFEB1555),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class RowButtons extends StatelessWidget {
  RowButtons({@required this.icon, @required this.function});
  final IconData icon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: function,
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
    );
  }
}
