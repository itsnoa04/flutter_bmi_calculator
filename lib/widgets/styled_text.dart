import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class StyledText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;

  const StyledText({
    Key? key,
    required this.text,
    this.color = kTextHexColor,
    this.fontWeight = FontWeight.w800,
    this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      style: TextStyle(
        fontFamily: "Montserrat",
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      duration: const Duration(milliseconds: 200),
      child: Text(
        text,
      ),
    );
  }
}
