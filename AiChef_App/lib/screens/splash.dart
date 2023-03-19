import 'dart:async';

import 'package:aichef_app/main.dart';
import 'package:aichef_app/screens/signin.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../widgets/custom_button.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(Duration(seconds: 4),(){
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage(),));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.whiteshade,
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/images/Chef_logo.png',
                  width: 310, height: 337, alignment: Alignment(0, 0)),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 300,
              child: Column(
                children:  [
                  Text(
                    "Trusted by thousands of women's in india",textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Work Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffbac939393),
                    ),


                  ),
                  SizedBox(
                    height: 24,
                  ),

                  RichText(
                    text: const TextSpan(
                    //  style: Theme.of(context).textTheme.body1,
                      children: [
                        TextSpan(text: '100% Safe & Secure. Made with',style: TextStyle(
                          fontFamily: 'Work Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),),
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.0),
                            child: Icon(Icons.favorite,color: Colors.red,),
                          ),
                        ),
                        TextSpan(text: 'in',style: TextStyle(
                          fontFamily: 'Work Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),),
                      ],
                    ),
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}

class CustomIcon {
  CustomIcon._();
  static const String? _kFontPkg = null;

  static const IconData heart = IconData(0xf442, fontFamily: 'CustomIcon', fontPackage: _kFontPkg);

}
