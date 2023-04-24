import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import  'package:bmi_calculator/calculator_brain.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  // inital value atadım ilk başta hata çıkmasın diye yoksa bir mantığı yok
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 18;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        // primary color'u tanıması için bunu yazdık
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        // HEIGHT textini yazınca olduğu container HEIGHT boyutunda
        // küçüldüğü için bunu yaptı
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [

          Expanded(child: Row(
            children: <Widget> [
              // Gesture Detector TextButton gibi çalışıyor
              Expanded(child: ReusableCard(
                  // onPressed parametresi için anonymus bir function oluşturduk
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  // Ternary check
                  colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  carChild: IconContent(cardText: 'MALE', cardIcon: FontAwesomeIcons.mars),
              ),),
              Expanded(child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  // Ternary check
                  colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                  carChild: IconContent(cardText: 'FEMALE', cardIcon: FontAwesomeIcons.venus ,),

              ),
              ),
            ],
          )),

          Expanded(child: ReusableCard(
            carChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
              ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  height.toString(), // 180
                  style: kNumbersTextStyle,
                ),
                Text(
                  ' cm',
                  style: kLabelTextStyle,
                ),
              ],),
                SliderTheme(data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Color(0xFF8D8E98),
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555), //transparency, FF:29
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                ),
                  child: Slider(
                      value: height.toDouble(),
                      min: kMinSlider,
                      max: kMaxSlider,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      }
                  ),
                ),
              ],
            ),
              colour: kActiveCardColor,),),

          Expanded(child: Row(
            children: <Widget> [
              Expanded(child: ReusableCard(
                  colour: kActiveCardColor,
                  carChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'WEIGHT',
                      style: kLabelTextStyle),
                      Text(
                        weight.toString(),
                        style: kNumbersTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              action: (){
                                setState(() {
                                  weight--;
                                });
                              },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              action: (){
                                setState(() {
                                  weight++;
                                });
                              },
                          ),
                        
                      ],)
                    ],
                  ),
              ),),
              Expanded(child: ReusableCard(
                  colour: kActiveCardColor,
                  carChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumbersTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              action: (){
                              setState(() {
                                age--;
                              });
                            }),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              action: (){
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      ),
                    ],
                  ),),),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){

              // class'tan obje yarattık
              // burada inputları alıp hesaplama yaptırıyoruz
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    // results page class'taki inputları input page'den çekiyoruz
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                  )));
            },
          ),
        ],
      )
    );
  }
}












