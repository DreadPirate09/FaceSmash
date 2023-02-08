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
    print(downloadUrl.toString());
    Uri uri = Uri.https(Uri.parse(downloadUrl).authority,
        Uri.parse(downloadUrl).path, Uri.parse(downloadUrl).queryParametersAll);
    print(Uri.parse(downloadUrl).authority);
    print(Uri.parse(downloadUrl).path);
    print(Uri.parse(downloadUrl).queryParametersAll);
    // var resp = await http.get(uri).then((response) {
    //   print(json.decode(response.body));
    // });
    var response = await http.get(uri);

    print(response.statusCode);
  }
}
