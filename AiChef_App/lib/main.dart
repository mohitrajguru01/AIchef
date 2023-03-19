import 'dart:async';

import 'package:aichef_app/screens/signup.dart';
import 'package:aichef_app/screens/splash.dart';
import 'package:aichef_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo, textTheme: TextTheme()),
      home: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(Duration(seconds: 4),(){
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUp(),));
  //   });
  // }
  //

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero'),
      ),
      body:Container(
        color: AppColors.blue,
        child: Center(
          child: Image.asset('assets/images/robot-chef.png'),
        ),
      ),
    );
  }


}
