import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber_clone/main.dart';
import 'package:uber_clone/screens/login_screen.dart';
import 'package:uber_clone/screens/main_screen.dart';

class RegisterationScreen extends StatelessWidget {
  static const String screenName = "register";
   RegisterationScreen({Key? key}) : super(key: key);
  
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              const Image(
                image: AssetImage("images/logo.png"),
                height: 250,
                width: 390,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 1,
              ),
              const Text(
                "Register as a Rider",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Brand Bold"
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:  [
                    TextField(
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                              fontSize: 14
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10
                          )
                      ),
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              fontSize: 14
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10
                          )
                      ),
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: "Phone",
                          labelStyle: TextStyle(
                              fontSize: 14
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10
                          )
                      ),
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontSize: 14
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10
                          )
                      ),
                      style: TextStyle(
                          fontSize: 14
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: (){
                          registerNewUser(context);
                        },
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Brand Bold"
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.screenName, (route) => false);
                  },
                  child: Text(
                      'Already have an Account? Login Here.'
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async {
     final User? firebaseUser =  (await _firebaseAuth.createUserWithEmailAndPassword(email: emailTextEditingController.text,
         password: passwordTextEditingController.text).catchError((errorMsg){
           Fluttertoast.showToast(msg: "Error:" + errorMsg.toString() );
     })).user;
     if(firebaseUser != null){
       Map userDataMap = {
         "name" : nameTextEditingController.text.trim(),
         "email" : emailTextEditingController.text.trim(),
         "phone" : phoneTextEditingController.text.trim()
       };
       usersRef.child(firebaseUser.uid).set(userDataMap);
       Fluttertoast.showToast(msg: "Congratulations, your account has been created");
       Navigator.pushNamedAndRemoveUntil(context, MainScreen.screenName, (route) => false);
     }
     else{
       Fluttertoast.showToast(msg: "New user account has not been created");
     }
  }
}
