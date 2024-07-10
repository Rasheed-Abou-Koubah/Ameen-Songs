import 'package:ameen/buysong.dart';
import 'package:ameen/component/enterbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Songdetailes extends StatefulWidget {
  const Songdetailes({
    super.key,
    required this.title,
    required this.type,
    required this.price,
    required this.artist,
  });
  final String title;
  final String type;
  final String price;
  final String artist;

  @override
  State<Songdetailes> createState() => _SongdetailesState();
}

class _SongdetailesState extends State<Songdetailes> {
  List<QueryDocumentSnapshot> data = [];

  @override
  Widget build(BuildContext context) {
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
          child: ListView(
            children: [
              ListTile(
                  leading: Text("Name : ${widget.title}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15))),
              ListTile(
                leading: Text(
                  "Type : ${widget.type}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              ListTile(
                leading: Text("Price : ${widget.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              ListTile(
                leading: Text("Artist : ${widget.artist}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              Enterbutton(
                Color: Colors.red,
                buttonname: "Buy Song",
                textcolor: Colors.white,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Buysong()));
                },
              )
            ],
          ),
        ));
  }
}
