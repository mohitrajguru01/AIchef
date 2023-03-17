import 'package:aichef_app/screens/signin.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../widgets/custom_button.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero'),
      ),
      body:Container(
        color: AppColors.blue,
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/images/robot-chef.png'),
            ),

        AuthButton(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Signin(),));

          },
          text: 'Get Stated',
        ),
          ],
        ),
      ),
    );
  }
}
