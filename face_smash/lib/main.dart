import 'dart:html';

import 'package:face_smash/names_mapper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:face_smash/storage_service.dart';
import 'package:face_smash/counter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDSX_cB0dfNrO85CQP9WwXSU9PXPGQsIRk",
          appId: "1:492296649989:android:a529aaf721c62e8f3f8b6c",
          messagingSenderId: "492296649989",
          projectId: "face-smash-b3479",
          storageBucket: "face-smash-b3479.appspot.com",
          authDomain:
              "492296649989-lh178b7si4b5didnp355pooq09ag7hsh.apps.googleusercontent.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Face Smash Poli'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    final Counter counter = Counter.instance;
    final NamesMapper names = NamesMapper();
    String name1 = "none";
    String name2 = "none";
    int counter1 = counter.get() as int;
    int counter2 = (counter.get() as int) + 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: GridView.count(
        crossAxisCount: 2,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(children: [
              FutureBuilder(
                  future: storage.downloadURL('img$counter1.jpg'),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Container(
                        width: 400,
                        height: 400,
                        child: Image.network(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        !snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return Container();
                  }),
              Center(
                  child: Text('The guy number $counter1',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ))),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter.incrementCounter();
                    });
                    print(counter1);
                  },
                  child: Text('This is the guy nr $counter1'),
                ),
              ),
            ]),
          ),
          Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  FutureBuilder(
                      future: storage.downloadURL('img$counter2.jpg'),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          return Container(
                            width: 400,
                            height: 400,
                            child: Image.network(
                              snapshot.data!,
                              fit: BoxFit.cover,
                            ),
                          );
                        }
                        if (snapshot.connectionState ==
                                ConnectionState.waiting ||
                            !snapshot.hasData) {
                          return CircularProgressIndicator();
                        }
                        return Container();
                      }),
                  Center(
                      child: Text('The guy number $counter2',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ))),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        counter2 += 1;
                      },
                      child: Text('This is the guy nr $counter2'),
                    ),
                  )
                ],
              )),
          FutureBuilder(
              future: names.downloadURL('map_names.txt'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    width: 300,
                    height: 250,
                    child: ElevatedButton(
                      onPressed: () async {
                        counter2 += 1;
                      },
                      child: Text(snapshot.data!.characters.string),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              })
        ],
      )),
    );
  }
}
