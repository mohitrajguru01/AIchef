import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 270,
              ),
              Container(

                width: 390,
                height: 190,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    //set border radius more than 50% of height and width to make circle
                  ),

                  color: Color(0xffe1e2e3),
                  elevation: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      TextField(
                        style:TextStyle(color: Colors.black) ,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text('Email'),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      TextField(
                        style:TextStyle(color: Colors.black,) ,

                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text('Password'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                    ],
                  ),
                ),


              ),
              TextButton(onPressed: (){

              },
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?',style: TextStyle(fontSize: 21)),
                  ],

                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                  onPrimary: Colors.white,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: Size(120, 50), //////// HERE
                ),
                onPressed: () {},
                child: Text('Login',style: TextStyle(fontSize: 20),),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Don't have an account? ",style: TextStyle(fontSize: 15),),
              TextButton(onPressed: (){
              }, child: Text('Register now',style: TextStyle(fontSize: 17)),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
