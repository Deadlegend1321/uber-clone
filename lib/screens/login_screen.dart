import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  "Login as a Rider",
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
                    TextField(
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
                      height: 1,
                    ),
                    ElevatedButton(
                        onPressed: (){

                        },
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                                "Login",
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

                  },
                  child: Text(
                    'Do not have an Account? Register Here.'
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
