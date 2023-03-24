import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final String text;
   final String fontFamily;
   final double fontSize;
   final FontWeight fontWeight;
     final int textColor;

    CustomText({
   required this.text,required this.fontFamily,required this.fontSize,required this.fontWeight,required this.textColor
});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,textAlign: TextAlign.center,style: TextStyle(

      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color:Color(textColor as int),

    ),
    );
  }
}
