import 'package:ameen/component/enterbutton.dart';
import 'package:ameen/component/textfeild.dart';
import 'package:ameen/displaysongs.dart';
import 'package:flutter/material.dart';

class Buysong extends StatelessWidget {
  const Buysong({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController buy = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Music app",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 80),
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Please Enter your Credit Card Number",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Customtextfeild(
                  hint: "Credit Card Number",
                  password: false,
                  mycontroller: buy,
                  validator: (value) {}),
              const SizedBox(
                height: 30,
              ),
              Enterbutton(
                  Color: Colors.red,
                  buttonname: "Buy",
                  textcolor: Colors.white,
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Displaysongs()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
