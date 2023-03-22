import 'package:aichef_app/screens/home.dart';
import 'package:aichef_app/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../widgets/custom_text.dart';
class Otp_Login extends StatelessWidget {
  final int Number;
  final String verify;
  Otp_Login(
     {
       required  this.Number,required this.verify}
     );

  FirebaseAuth auth = FirebaseAuth.instance;
  var code="";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''),
      // ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xfffffffff),
          child: SingleChildScrollView(
            child: Column(

                children: [

                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    child:Image.asset('assets/images/Chef_logo.png',
                      width: 149, height: 174, ) ,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      child:  RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          //  style: Theme.of(context).textTheme.body1,
                          children: [
                            TextSpan(text: 'Please enter the 6-digit code sent to you at +91 ',style: TextStyle(
                              fontFamily: 'Work Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff747474),
                            ),),

                            TextSpan(
                              text: Number.toString(),style: TextStyle(
                                fontFamily: 'Work Sans',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff747474),
                                decoration: TextDecoration.none
                            ),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),

              SizedBox(
                height: 50,
              ),
                  Container(
                    width: 350,
                    child: OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 50,
                      style: TextStyle(
                          fontSize: 17
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.underline,
                      onCompleted: (pin) {
                        code=pin;
                        print("Completed: " + pin);
                        print('PINNNNNNNNNNN'+pin);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  RichText(
                    text: const TextSpan(
                      //  style: Theme.of(context).textTheme.body1,
                      children: [
                        TextSpan(text: 'Resend code in  ',style: TextStyle(
                          fontFamily: 'Work Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff747474),
                        ),),

                        TextSpan(
                          text: '20 seconds',style: TextStyle(
                            fontFamily: 'Work Sans',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffED1C24),
                            decoration: TextDecoration.underline
                        ),
                        ),
                      ],
                    ),
                  ),SizedBox(
                    height: 55,
                  ),
                  AuthButton(onTap: () async{
                    print('CODDDDDDDD'+code);
                    print('IDDDDDDDDDDDDD=============>>>>>'+verify);
                                try {
                                  PhoneAuthCredential credential = PhoneAuthProvider
                                      .credential(
                                      verificationId: verify, smsCode: code);
                                  // Sign the user in (or link) with the credential
                                  await auth.signInWithCredential(credential);
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => HomeScreen()),);
                                }catch(e){
                                  print('Enter valid otp');
                                }


                  }, text: 'START'),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('assets/images/Splash_Bottom_image.png',fit:BoxFit.cover ,alignment:  Alignment.bottomCenter,),
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
