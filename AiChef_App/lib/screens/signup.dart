import 'package:aichef_app/screens/signin.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_formfield.dart';
import '../widgets/custom_header.dart';
import '../widgets/custom_richtext.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible=true;

  final _userName = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get userName => _userName.text.trim();
  String get email => _emailController.text.trim();

  String get password => _passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
        children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.blue,
            ),
            CustomHeader(
                text: 'Sign Up.',
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Signin()));
                }),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.08,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                decoration:  BoxDecoration(
                    color: AppColors.whiteshade.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.09),
                      child: Image.asset("assets/images/login.png"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                     CustomFormField(
                     //   headingText: "UserName",
                        hintText: "username",
                        obsecureText: false,
                       // suffixIcon: const SizedBox(),
                        preffixIcon: Icon(Icons.person),
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.text,
                        controller: _userName,
                      ),

                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                     // headingText: "Email",
                      hintText: "Email",
                      preffixIcon: Icon(Icons.email),
                      obsecureText: false,
                      //suffixIcon: const SizedBox(),

                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      controller: _passwordController,
                   //   headingText: "Password",
                      preffixIcon: Icon(Icons.lock),
                      hintText: "At least 8 Character",
                      obsecureText: _passwordVisible,
                      // suffixIcon:  InkWell(
                      //   onTap: () {
                      //     _passwordVisible = !_passwordVisible;
                      //     setState(() {});
                      //   },
                      //   child: Icon(_passwordVisible
                      //       ? Icons.visibility_off
                      //       : Icons.visibility),
                      // ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthButton(
                      onTap: () {
                        print(email);
                        print(userName);
                      },
                      text: 'Sign Up',
                    ),
                    CustomRichText(
                      discription: 'Already Have an account? ',
                      text: 'Log In here',
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signin()));
                      },
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
          )),
    );
  }
}
