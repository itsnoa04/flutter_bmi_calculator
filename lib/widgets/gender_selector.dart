// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/widgets/styled_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

class GenderWheelSlider extends StatefulWidget {
  final double extend;
  final double activeFontSize;
  final double inactiveFontSize;
  final Axis scrollDirection;
  final Function onSelectedItemChange;
  final double perspective;
  final double diameterRatio;
  const GenderWheelSlider({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.perspective = 0.009,
    this.diameterRatio = 1.5,
    required this.extend,
    required this.activeFontSize,
    required this.inactiveFontSize,
    required this.onSelectedItemChange,
  }) : super(key: key);

  @override
  State<GenderWheelSlider> createState() => _GenderWheelSliderState();
}

class _GenderWheelSliderState extends State<GenderWheelSlider> {
  int selectedGenderIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> list = ["MALE", "FEMALE"];
    return ListWheelScrollViewX(
      scrollDirection: widget.scrollDirection,
      itemExtent: widget.extend,
      physics: const FixedExtentScrollPhysics(),
      onSelectedItemChanged: (index) {
        HapticFeedback.heavyImpact();
        setState(() {
          selectedGenderIndex = index;
        });
        widget.onSelectedItemChange(index);
      },
      perspective: widget.perspective,
      diameterRatio: widget.diameterRatio,
      children: list
          .map(
            (item) => Center(
              child: StyledText(
                  text: item,
                  fontSize: item == list[selectedGenderIndex]
                      ? widget.activeFontSize
                      : widget.inactiveFontSize,
                  color: item == list[selectedGenderIndex]
                      ? (item == "MALE" ? kMaleActiveColor : kFemaleActiveColor)
                      : (item == "MALE"
                          ? kMaleUnactiveColor
                          : kFemaleUnactiveColor)),
            ),
          )
          .toList(),
    );
  }
}
