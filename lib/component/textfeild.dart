import 'package:flutter/material.dart';

class Customtextfeild extends StatelessWidget {
  const Customtextfeild(
      {super.key,
      required this.hint,
      // required this.mycontroller,
      required this.password,
      required this.mycontroller,
      required this.validator});
  final String hint;
  final bool password;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  //final TextEditingController mycontroller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        style: TextStyle(fontWeight: FontWeight.bold),
        validator: validator,
        controller: mycontroller,
        obscureText: password,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
