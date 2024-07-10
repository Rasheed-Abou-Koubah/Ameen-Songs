import 'package:ameen/addartist.dart';
import 'package:ameen/addsong.dart';
import 'package:ameen/component/enterbutton.dart';
import 'package:ameen/displayartists.dart';
import 'package:ameen/displaysongs.dart';
import 'package:ameen/searchartist.dart';
import 'package:ameen/searchsong.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Addsong()));
              },
              child: Container(
                color: Colors.red,
                child: const ListTile(
                  leading: Icon(Icons.music_note_rounded),
                  title: Text("Add Song"),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Addartist()));
              },
              child: Container(
                color: Colors.red,
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    "Add Artist",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout_outlined))
        ],
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
              const SizedBox(
                height: 20,
              ),
              Enterbutton(
                  Color: Colors.red,
                  buttonname: "All Songs",
                  textcolor: Colors.white,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Displaysongs()));
                  }),
              const SizedBox(
                height: 20,
              ),
              Enterbutton(
                  Color: Colors.red,
                  buttonname: "All Artist",
                  textcolor: Colors.white,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Displayartists()));
                  }),
              const SizedBox(
                height: 20,
              ),
              Enterbutton(
                  Color: Colors.red,
                  buttonname: "Search Songs",
                  textcolor: Colors.white,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Searchsong()));
                  }),
              const SizedBox(
                height: 20,
              ),
              Enterbutton(
                  Color: Colors.red,
                  buttonname: "Search Artists",
                  textcolor: Colors.white,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Searchartist()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
