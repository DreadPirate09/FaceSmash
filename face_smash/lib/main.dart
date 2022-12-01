import 'package:flutter/material.dart';

void main() {
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
            ]),
          ),
          Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Ink.image(
                    image: const NetworkImage(
                        'https://scontent.fclj1-2.fna.fbcdn.net/v/t31.18172-8/13913813_992246950890777_1554047631026260258_o.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_ohc=Ov3UobRM5EAAX-6GvKC&_nc_ht=scontent.fclj1-2.fna&oh=00_AfCJdTqjWFhr9kTg1hjZudYgNx-fWlAR-IImONs91OkVDQ&oe=63B05BCD'),
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
