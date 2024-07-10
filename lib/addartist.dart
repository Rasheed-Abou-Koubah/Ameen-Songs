import 'package:ameen/component/enterbutton.dart';
import 'package:ameen/component/textfeild.dart';
import 'package:ameen/displayartists.dart';
import 'package:ameen/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addartist extends StatefulWidget {
  const Addartist({super.key});

  @override
  State<Addartist> createState() => _AddartistState();
}

class _AddartistState extends State<Addartist> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController country = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  CollectionReference artists =
      FirebaseFirestore.instance.collection('artists');

  addartist() {
    // Call the user's CollectionReference to add a new user
    return artists
        .add({
          'fname': fname.text, // John Doe
          'lname': lname.text, // Stokes and Sons
          'gender': gender.text, // 42
          'country': country.text,
        })
        .then((value) => print("Artist Added"))
        .catchError((error) => print("Failed to add artist: $error"));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        child: Container(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 80),
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Customtextfeild(
                      hint: "First Name",
                      password: false,
                      mycontroller: fname,
                      validator: (value) {}),
                  const SizedBox(
                    height: 30,
                  ),
                  Customtextfeild(
                      hint: "Last Name",
                      password: false,
                      mycontroller: lname,
                      validator: (value) {}),
                  const SizedBox(
                    height: 30,
                  ),
                  Customtextfeild(
                      hint: "Gender",
                      password: false,
                      mycontroller: gender,
                      validator: (value) {}),
                  const SizedBox(
                    height: 30,
                  ),
                  Customtextfeild(
                      hint: "Country",
                      password: false,
                      mycontroller: country,
                      validator: (value) {}),
                  const SizedBox(
                    height: 30,
                  ),
                  Enterbutton(
                    Color: Colors.red,
                    buttonname: "Add Artist",
                    textcolor: Colors.white,
                    onTap: () {
                      addartist();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Addartist()));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Enterbutton(
                      Color: Colors.red,
                      buttonname: "Show Artists",
                      textcolor: Colors.white,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Displayartists()));
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  Enterbutton(
                      Color: Colors.red,
                      buttonname: "Back To Home",
                      textcolor: Colors.white,
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Homepage()));
                      })
                ],
              ),
            )),
      ),
    );
  }
}
