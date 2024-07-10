// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';

class Enterbutton extends StatelessWidget {
  final buttonname;
  final Color;
  final textcolor;
  final void Function()? onTap;

  const Enterbutton({
    super.key,
    this.buttonname,
    this.Color,
    this.onTap,
    this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: 260,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color,
          ),
          child: Center(
              child: Text(
            buttonname,
            style: TextStyle(
                color: textcolor, fontSize: 15, fontWeight: FontWeight.bold),
          )),
        ));
  }
}
