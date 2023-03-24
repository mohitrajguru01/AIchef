import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/text_styles.dart';

class AuthButton extends StatefulWidget {
  final String text;
  final Function() onTap;

  const AuthButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,

      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration:  BoxDecoration(
            color: Color(0xffE9A200),

            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            widget.text,
            style: KTextStyle.authButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
