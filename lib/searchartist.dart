import 'package:ameen/artistdetailes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Searchartist extends StatefulWidget {
  const Searchartist({super.key});

  @override
  State<Searchartist> createState() => _SearchartistState();
}

class _SearchartistState extends State<Searchartist> {
  List<QueryDocumentSnapshot> data = [];
  String name = "";
  getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('artists').get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: const InputDecoration(
                prefix: Icon(Icons.search),
                hintText: " Search",
                border: InputBorder.none),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          //scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, i) {
            if (name == "") {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Artistdetailes(
                            fname: data[i]['fname'],
                            lname: data[i]['lname'],
                            country: data[i]['country'],
                            gender: data[i]['gender'],
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: Card(
                    color: Colors.red[100],
                    child: ListTile(
                      leading: Text(data[i]["fname"].toString()),
                      trailing: const Text(""),
                    ),
                  ),
                ),
              );
            } else if (data[i]["fname"].toString().startsWith(name) ||
                data[i]["lname"].toString().startsWith(name)) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Artistdetailes(
                            fname: data[i]['fname'],
                            lname: data[i]['lname'],
                            country: data[i]['country'],
                            gender: data[i]['gender'],
                          )));
                },
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Card(
                        color: Colors.red[100],
                        child: ListTile(
                          leading: Text(data[i]["fname"].toString()),
                          trailing: const Text(""),
                        ))),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
