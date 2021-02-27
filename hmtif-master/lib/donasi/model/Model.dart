import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ModelData{

  // Future<DocumentSnapshot> saveData(String name,Map<String, dynamic> aspirasi) async {
  //   await Firebase.initializeApp();
  //   DocumentReference documentReference =
  //       Firestore.instance.collection("AspirasiMahasiswa").document();


  //   documentReference.setData(aspirasi).whenComplete(() {
  //     print("$name created");
  //   });
  // }
  Future<DocumentSnapshot> saveDonasi(String namaDonasi,String documentId,Map<String, dynamic> aspirasi) async {
    await Firebase.initializeApp();
    DocumentReference documentReference =
        Firestore.instance.collection("Donasi").document(documentId);


    documentReference.setData(aspirasi).whenComplete(() {
      print("$namaDonasi created");
    });
  }

    Future<DocumentSnapshot> saveData(String nomor,Map<String, dynamic> donasi) async {
    await Firebase.initializeApp();
    DocumentReference documentReference =
        Firestore.instance.collection("Donatur").document();


    documentReference.setData(donasi).whenComplete(() {
      print("$nomor created");
    });
  }
}