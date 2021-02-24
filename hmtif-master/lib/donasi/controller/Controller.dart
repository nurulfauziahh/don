import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hmtif/donasi/model/Model.dart';

class ControllerData {
  ModelData modelData = new ModelData();
  // Future<DocumentSnapshot> createData(String name, String deskripsi) async {
  //   await Firebase.initializeApp();

  //   Map<String, dynamic> aspirasi = {
  //     "name": name,
  //     "deskripsi": deskripsi,
  //   };
  //   modelDatabase.saveData(name, aspirasi);
  // }

  // Future<DocumentSnapshot> post(
  //     String name, String deskripsi, String documentId) async {
  //   await Firebase.initializeApp();

  //   Map<String, dynamic> postAspirasi = {
  //     "name": name,
  //     "deskripsi": deskripsi,
  //     "jumlahLike": 0,
  //   };
  //   modelDatabase.saveAspirasi(name,documentId, postAspirasi);
  // }

  Future<DocumentSnapshot> updateJumlah(
      String namaDonasi, String deskripsi, int danaDonasi, String gambarDonasi, String documentId) async {
    await Firebase.initializeApp();

    Map<String, dynamic> updateJumlahDonasi = {
     "namaDonasi": namaDonasi,
     "deskripsi": deskripsi,
     "gambarDonasi" : gambarDonasi,
      "danaDonasi": danaDonasi + 1,
    };
    modelData.saveDonasi(namaDonasi,documentId, updateJumlahDonasi);
  }
}
