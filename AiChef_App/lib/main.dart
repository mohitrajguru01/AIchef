import 'dart:async';

import 'package:aichef_app/screens/home.dart';
import 'package:aichef_app/screens/register.dart';
import 'package:aichef_app/screens/signup.dart';
import 'package:aichef_app/screens/splash.dart';
import 'package:aichef_app/styles/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => HomeScreen(),
      },
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Register(),));

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero'),
      ),
      body: Container(
           ),
    );
  }


}
