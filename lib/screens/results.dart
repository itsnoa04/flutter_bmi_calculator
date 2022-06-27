import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/widgets/styled_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String bmi;
  final String result;
  final Color color;
  const Result({
    Key? key,
    required this.bmi,
    required this.result,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgHexColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const StyledText(
          text: "BMI CALCULATOR",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 10,
                      color: color,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      StyledText(
                        text: bmi,
                        fontSize: 94,
                      ),
                      StyledText(
                        text: result,
                        fontSize: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
