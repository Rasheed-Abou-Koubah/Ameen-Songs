import 'package:ameen/component/enterbutton.dart';
import 'package:ameen/component/textfeild.dart';
import 'package:ameen/displaysongs.dart';
import 'package:ameen/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addsong extends StatefulWidget {
  const Addsong({super.key});

  @override
  State<Addsong> createState() => _AddsongState();
}

class _AddsongState extends State<Addsong> {
  TextEditingController title = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController artist = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  CollectionReference songs = FirebaseFirestore.instance.collection('songs');

  addsong() {
    // Call the user's CollectionReference to add a new user
    return songs
        .add({
          'title': title.text, // John Doe
          'type': type.text, // Stokes and Sons
          'price': price.text, // 42
          'artist': artist.text,
        })
        .then((value) => print("Song Added"))
        .catchError((error) => print("Failed to add song: $error"));
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
                      hint: "Title",
                      password: false,
                      mycontroller: title,
                      validator: (value) {}),
                  const SizedBox(
                    height: 30,
                  ),
                  Customtextfeild(
                      hint: "Type",
                      password: false,
                      mycontroller: type,
                      validator: (value) {}),
                  const SizedBox(
                    height: 30,
                  ),
                  Customtextfeild(
                      hint: "Price",
                      password: false,
                      mycontroller: price,
                      validator: (value) {}),
                  const SizedBox(
                    height: 30,
                  ),
                  Customtextfeild(
                      hint: "Artist",
                      password: false,
                      mycontroller: artist,
                      validator: (value) {}),
                  const SizedBox(
                    height: 30,
                  ),
                  Enterbutton(
                    Color: Colors.red,
                    buttonname: "Add Song",
                    textcolor: Colors.white,
                    onTap: () {
                      addsong();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Addsong()));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Enterbutton(
                      Color: Colors.red,
                      buttonname: "Show Songs",
                      textcolor: Colors.white,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Displaysongs()));
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
                            builder: (context) => const Homepage()));
                      })
                ],
              ),
            )),
      ),
    );
  }
}
