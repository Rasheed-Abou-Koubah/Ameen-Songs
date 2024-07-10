import 'package:ameen/component/enterbutton.dart';
import 'package:ameen/component/textfeild.dart';
import 'package:ameen/registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
            key: formstate,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 80),
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Ameen Homeword",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.topLeft,
                    //   child: const Text(
                    //     "Login",
                    //     style: TextStyle(fontSize: 20),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 50,
                    ),
                    Customtextfeild(
                      validator: (value) {
                        if (value == " ") {
                          return "Empty Feild";
                        }
                      },
                      hint: "email",
                      password: false,
                      mycontroller: email,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Customtextfeild(
                      hint: "password",
                      password: true,
                      mycontroller: password,
                      validator: (value) {
                        if (value == " ") {
                          return "Empty Feild";
                        }
                      },
                    ),
                    InkWell(
                      onTap: () {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email.text);
                      },
                      child: Container(
                          margin: const EdgeInsets.all(8),
                          alignment: Alignment.bottomRight,
                          child: const Text(
                            "forget password",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Enterbutton(
                        buttonname: "Login",
                        Color: Colors.red,
                        textcolor: Colors.white,
                        onTap: () async {
                          if (formstate.currentState!.validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email.text,
                                      password: password.text);
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(
                              //         builder: (context) => const Shoppage()));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }
                          }
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     InkWell(
                    //       onTap: () {},
                    //       child: const Image(
                    //         width: 50,
                    //         image: AssetImage("assets/images/google_logo.png"),
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 40,
                    //     ),
                    //     InkWell(
                    //       onTap: () {},
                    //       child: const Image(
                    //         width: 90,
                    //         image: AssetImage("assets/images/facebook_logo.png"),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    Enterbutton(
                      Color: Colors.grey[300],
                      textcolor: Colors.black,
                      buttonname: "Create account",
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Registerpage()));
                      },
                    )
                  ],
                ),
              ),
            )));
  }
}
