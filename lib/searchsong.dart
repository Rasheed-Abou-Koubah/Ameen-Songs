import 'package:ameen/songdetailes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Searchsong extends StatefulWidget {
  const Searchsong({super.key});

  @override
  State<Searchsong> createState() => _SearchsongState();
}

class _SearchsongState extends State<Searchsong> {
  List<QueryDocumentSnapshot> data = [];
  String name = "";
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: const InputDecoration(
              prefix: Icon(Icons.search),
              hintText: " Search",
              border: InputBorder.none,
            ),
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
                      builder: (context) => Songdetailes(
                            title: data[i]['title'],
                            type: data[i]['type'],
                            price: data[i]['price'],
                            artist: data[i]['artist'],
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: Card(
                    color: Colors.red[100],
                    child: ListTile(
                      leading: Text(data[i]["title"].toString()),
                      trailing: const Text(""),
                    ),
                  ),
                ),
              );
            } else if (data[i]["title"].toString().startsWith(name) ||
                data[i]["artist"].toString().startsWith(name)) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Songdetailes(
                            title: data[i]['title'],
                            type: data[i]['type'],
                            price: data[i]['price'],
                            artist: data[i]['artist'],
                          )));
                },
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Card(
                        color: Colors.red[100],
                        child: ListTile(
                          leading: Text(data[i]["title"].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
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
