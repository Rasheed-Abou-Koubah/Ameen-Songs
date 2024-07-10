import 'package:ameen/artistdetailes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Displayartists extends StatefulWidget {
  const Displayartists({
    super.key,
  });

  @override
  State<Displayartists> createState() => _DisplayartistsState();
}

class _DisplayartistsState extends State<Displayartists> {
  List<QueryDocumentSnapshot> data = [];
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Music app",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 40, mainAxisSpacing: 40),
          itemCount: data.length,
          itemBuilder: (context, i) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 5),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Artistdetailes(
                              fname: data[i]['fname'],
                              lname: data[i]['lname'],
                              country: data[i]['country'],
                              gender: data[i]['gender'],
                            )));
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        "${data[i]['fname']}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ));
          }),
    );
  }
}
