import 'package:ameen/component/enterbutton.dart';
import 'package:ameen/component/textfeild.dart';
import 'package:ameen/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
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
                    "Ameen Homework",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                // Container(
                //   alignment: Alignment.topLeft,
                //   child: const Text(
                //     "Register",
                //     style: TextStyle(
                //       fontSize: 20,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 30,
                ),
                Customtextfeild(
                  validator: (value) {
                    if (value == " ") {
                      return "Empty Feild";
                    }
                  },
                  hint: "username",
                  password: false,
                  mycontroller: username,
                ),
                const SizedBox(
                  height: 25,
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
                  height: 25,
                ),
                Customtextfeild(
                  validator: (value) {
                    if (value == " ") {
                      return "Empty Feild";
                    }
                  },
                  hint: "password",
                  password: true,
                  mycontroller: password,
                ),
                const SizedBox(
                  height: 25,
                ),
                // Customtextfeild(
                //   hint: "re password",
                //   password: true,
                //   mycontroller: password,
                // ),
                // const SizedBox(
                //   height: 25,
                // ),
                Enterbutton(
                    Color: Colors.red,
                    textcolor: Colors.white,
                    buttonname: "Register",
                    onTap: () async {
                      if (formstate.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => const Shoppage()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    }),
                const SizedBox(
                  height: 30,
                ),
                Enterbutton(
                  Color: Colors.grey[300],
                  buttonname: "back to Login page",
                  textcolor: Colors.black,
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Loginpage()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
