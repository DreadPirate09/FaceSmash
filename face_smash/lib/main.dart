import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:face_smash/storage_service.dart';

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
              Ink.image(
                image: const NetworkImage(
                    'https://scontent.fclj1-2.fna.fbcdn.net/v/t1.6435-9/42541811_124109625223042_1116314020874289152_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=174925&_nc_ohc=mlmdHAfKkysAX-f0w8A&_nc_ht=scontent.fclj1-2.fna&oh=00_AfCLG3DEeLfzeJLVFN9cKf0yILFQTwOxB2W2l0kcq1UTKg&oe=63B074E5'),
                height: 400,
                fit: BoxFit.cover,
              ),
              Text("The guy number 1",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ))
            ]),
          ),
          Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Center(
                    child: Ink.image(
                      image: const NetworkImage(
                          'https://scontent.fclj1-2.fna.fbcdn.net/v/t31.18172-8/13913813_992246950890777_1554047631026260258_o.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_ohc=Ov3UobRM5EAAX-6GvKC&_nc_ht=scontent.fclj1-2.fna&oh=00_AfCJdTqjWFhr9kTg1hjZudYgNx-fWlAR-IImONs91OkVDQ&oe=63B05BCD'),
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                      child: Text("The guy number 2",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ))),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        final results = await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          type: FileType.custom,
                          allowedExtensions: ['png', 'jpg'],
                        );

                        if (results == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No file selected.'),
                            ),
                          );
                          return null;
                        }
                      },
                      child: const Text('uplod img'),
                    ),
                  )
                ],
              )),
          FutureBuilder(
              future: storage.downloadURL('img2.PNG'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                final ref =
                    FirebaseStorage.instance.ref().child('test/img2.PNG');
                // no need of the file extension, the name will do fine.
                var url = ref.getDownloadURL();
                print(url);
                print(snapshot.connectionState);
                print(snapshot.hasData);
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    width: 300,
                    height: 250,
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
              })
        ],
      )),
    );
  }
}
