import 'package:ameen/songdetailes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Displaysongs extends StatefulWidget {
  const Displaysongs({super.key});

  @override
  State<Displaysongs> createState() => _DisplaysongsState();
}

class _DisplaysongsState extends State<Displaysongs> {
  List data = [];
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
        child: SingleChildScrollView(
          child: GridView.builder(
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
                            builder: (context) => Songdetailes(
                                  title: data[i]['title'],
                                  type: data[i]['type'],
                                  price: data[i]['price'],
                                  artist: data[i]['artist'],
                                )));
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                            "${data[i]['title']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ));
              }),
        ),
      ),
    );
  }
}
