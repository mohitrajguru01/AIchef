import 'dart:collection';
import 'dart:math';

import 'package:aichef_app/model/user_model.dart';
import 'package:aichef_app/screens/otp_code.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_formfield.dart';
import '../widgets/custom_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Register extends StatelessWidget {

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  String get name => _nameController.text.trim();

  List<UserModel> users = [];
  late UserModel currentUser;

  int get mobile => int.parse(_phoneController.text.trim());
  var code='+91';
  late String username='bh';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                child: Image.asset('assets/images/Chef_logo.png',
                  width: 149, height: 174, ),
              ),
            SizedBox(
              height: 24,
            ),
            Container(
                child: CustomText(
                  text:"Join us for Best Recipes in your Finger Tips" ,
                  fontFamily: 'Work Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  textColor: 0xff747474,
                ),

              ),
              SizedBox(
                height: 70,
              ),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFormField(

                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      preffixIcon:Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "What is your name?",
                      obsecureText: false,

                      controller: _nameController,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomFormField(

                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number,
                      preffixIcon: Icon(Icons.phone),

                      hintText: "Enter Phone Number",
                      obsecureText: false,

                      controller: _phoneController,
                    ),

                    SizedBox(
                      height: 29,
                    ),
                    RichText(
                      text: const TextSpan(
                        //  style: Theme.of(context).textTheme.body1,
                        children: [
                          TextSpan(text: 'By creating an account, you agree to our ',style: TextStyle(
                            fontFamily: 'Work Sans',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff747474),
                          ),),

                          TextSpan(
                            text: 'Term & Conditions',style: TextStyle(
                            fontFamily: 'Work Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff747474),
                            decoration: TextDecoration.underline
                          ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 91,
                    ),
                    AuthButton(
                      onTap: () async{
                        // registerUser(UserModel(username: name, phone: mobile.toString()));

                        // fetching all users
                        // users = await fetchAllUser();
                        // print(users.toString());
                        //
                        // //fetch current user
                        currentUser = await fetchUser(mobile.toString());
                        print(currentUser.toString());

                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '+91${mobile}',
                          verificationCompleted: (PhoneAuthCredential credential) {

                          },
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>  Otp_Login(Number:mobile,verify:verificationId)),);
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );

                       Navigator.push(context,MaterialPageRoute(builder: (context) =>  Otp_Login(Number:mobile)),);
                      },
                      text: username.toString(),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Align(

                      alignment: Alignment.bottomRight,
                      child: Image.asset('assets/images/Splash_Bottom_image.png',fit:BoxFit.cover ,width: 245,height: 152,),
                    ),
                  ],
                ),
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }

  Future registerUser(UserModel userModel)async{
    FirebaseFirestore db = FirebaseFirestore.instance;
    UserModel use = userModel;
    db.collection("User").add(use.toFirestore());
  } //Store user Mohitdata in firestore

  Future<UserModel> fetchUser(String phone) async{
    final CollectionReference usersCollection = FirebaseFirestore.instance.collection('User');
    final QuerySnapshot querySnapshot = await usersCollection.where('phone', isEqualTo: phone).get();
    UserModel user = const UserModel(username: "hello", phone: "world");
    if (querySnapshot.size != 0) {
      if(querySnapshot.docs[0].data() != null){
        user = UserModel.fromFirestore(querySnapshot.docs[0]);
        return user;
      }
      else{
        print("Empty Document");
      }
    } else {
      print('No user found with this phone number');
    }
    return user;
  }// fetch Current user

  Future<List<UserModel>> fetchAllUser() async {
    List<UserModel> Users = [];
    CollectionReference userCollection = FirebaseFirestore.instance.collection("User");
    QuerySnapshot querySnapshot = await userCollection.get();
    querySnapshot.docs.forEach((doc) {
      Users.add(UserModel.fromFirestore(doc));
    });
    return Users;
  } //Fetch all user data
}
