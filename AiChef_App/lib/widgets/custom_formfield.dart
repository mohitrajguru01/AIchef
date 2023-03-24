import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/text_styles.dart';


class CustomFormField extends StatelessWidget {
  //final String headingText;
  final String hintText;
  final bool obsecureText;
  //final Widget suffixIcon;
  final Widget preffixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final int maxLines;


  const CustomFormField(
      {Key? key,
     // required this.headingText,
      required this.hintText,
      required this.obsecureText,
    //  required this.suffixIcon,
        required this.preffixIcon,
      required this.textInputType,
      required this.textInputAction,
      required this.controller,
      required this.maxLines,
       })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),

        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              maxLines: maxLines,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              obscureText: obsecureText,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: KTextStyle.textFieldHintStyle,
                  border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff747474))),
                //  suffixIcon: suffixIcon,
                  prefixIcon: preffixIcon,
              ),
            ),
          ),
        )
      ],
    );
  }
}
