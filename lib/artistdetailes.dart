import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Artistdetailes extends StatefulWidget {
  const Artistdetailes(
      {super.key,
      required this.fname,
      required this.lname,
      required this.gender,
      required this.country});
  final String fname;
  final String lname;
  final String gender;
  final String country;

  @override
  State<Artistdetailes> createState() => _ArtistdetailesState();
}

class _ArtistdetailesState extends State<Artistdetailes> {
  List<QueryDocumentSnapshot> data = [];
  List songs = [];
  getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('songs').get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
                leading: Text("Name : ${widget.fname} ${widget.lname}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              ListTile(
                leading: Text("Gender : ${widget.gender}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              ListTile(
                leading: Text("Country : ${widget.country}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              ListTile(
                leading: Text("Songs : ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  //scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    if (data[i]['artist'].toString() == widget.fname ||
                        data[i]['artist'].toString() == widget.lname) {
                      //songs.add(data[i]['title'].toString());

                      return ListTile(
                        leading: Text(data[i]['title'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      );
                    }
                  })
            ],
          ),
        ));
  }
}
