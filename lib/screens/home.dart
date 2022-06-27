import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/logic/calc_BMI.dart';
import 'package:bmi_calculator/screens/results.dart';
import 'package:bmi_calculator/widgets/gender_selector.dart';
import 'package:bmi_calculator/widgets/number_wheel_slider.dart';
import 'package:bmi_calculator/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int age = 5;
  int weight = 20;
  int height = 50;
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgHexColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: StyledText(
            text: "BMI CALCULATOR",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Flexible(
                child: Row(
              children: [
                AgeSlider(
                  ageChange: (age) {
                    setState(() {
                      this.age = age;
                    });
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                WeightSlider(
                  weightChange: (weight) {
                    setState(() {
                      this.weight = weight;
                    });
                  },
                )
              ],
            )),
            const SizedBox(
              height: 10,
            ),
            HeightSlider(
              heightChange: (height) {
                setState(() {
                  this.height = height;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GenderSlider(
              genderChange: (gender) {
                setState(() {
                  this.gender = gender;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: kButtonGradient,
                  borderRadius: BorderRadius.circular(10)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: Colors.transparent,
                    minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  final bmiObj = BmiLogic(heightInCm: height, weight: weight);
                  final bmi = bmiObj.calcBMI();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => Result(
                            bmi: bmi,
                            result: bmiObj.getResult(),
                            color: bmiObj.getColor(),
                          )),
                    ),
                  );
                },
                child: const StyledText(
                  text: "CALCULATE",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GenderSlider extends StatelessWidget {
  final Function genderChange;
  const GenderSlider({
    Key? key,
    required this.genderChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kSecHexColor,
        ),
        child: Column(
          children: [
            const StyledText(text: "BIOLOGICAL GENDER"),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: SizedBox(
                child: GenderWheelSlider(
                  scrollDirection: Axis.horizontal,
                  extend: 300,
                  diameterRatio: 4,
                  perspective: 0.008,
                  activeFontSize: 64,
                  inactiveFontSize: 50,
                  onSelectedItemChange: (index) {
                    String gender = (index == 0 ? "Male" : "Female");
                    genderChange(gender);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const StyledText(
              text: "SWIPE TO CHANGE",
              fontSize: 14,
            )
          ],
        ),
      ),
    );
  }
}

class HeightSlider extends StatelessWidget {
  final Function heightChange;
  const HeightSlider({
    Key? key,
    required this.heightChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kSecHexColor,
        ),
        child: Column(
          children: [
            const StyledText(text: "HEIGHT [cm]"),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: SizedBox(
                child: NumberWheelSlider(
                  scrollDirection: Axis.horizontal,
                  from: 50,
                  to: 300,
                  extend: 200,
                  perspective: 0.005,
                  diameterRatio: 2,
                  activeFontSize: 94,
                  inactiveFontSize: 80,
                  onSelectedItemChange: (index) {
                    heightChange(index);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const StyledText(
              text: "SWIPE TO CHANGE",
              fontSize: 14,
            )
          ],
        ),
      ),
    );
  }
}

class WeightSlider extends StatelessWidget {
  final Function weightChange;
  const WeightSlider({
    Key? key,
    required this.weightChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: kSecHexColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const StyledText(text: "WEIGHT [kg]"),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: SizedBox(
                child: NumberWheelSlider(
                  from: 20,
                  to: 500,
                  extend: 70,
                  activeFontSize: 64,
                  inactiveFontSize: 50,
                  onSelectedItemChange: (index) {
                    weightChange(index);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const StyledText(
              text: "SWIPE TO CHANGE",
              fontSize: 14,
            )
          ],
        ),
      ),
    );
  }
}

class AgeSlider extends StatelessWidget {
  final Function ageChange;
  const AgeSlider({
    Key? key,
    required this.ageChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kSecHexColor,
        ),
        child: Column(
          children: [
            const StyledText(text: "AGE"),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: SizedBox(
                child: NumberWheelSlider(
                  from: 5,
                  to: 200,
                  extend: 70,
                  activeFontSize: 64,
                  inactiveFontSize: 50,
                  onSelectedItemChange: (index) {
                    ageChange(index);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const StyledText(
              text: "SWIPE TO CHANGE",
              fontSize: 14,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kSecHexColor,
        ),
      ),
    );
  }
}
