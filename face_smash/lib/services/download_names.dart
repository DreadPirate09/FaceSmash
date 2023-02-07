import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:convert';
import 'package:http/http.dart' as http;

class Names {
  Names();

  void doSomeStuff() async {
    final firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    Reference storageReference =
        storage.ref().child("boys_samples/map_names.txt");
    final downloadUrl = await storageReference.getDownloadURL();

    var response =
        await http.get(downloadUrl as Uri, headers: {'Accept': 'text/plain'});

    print(response.statusCode);
  }
}
