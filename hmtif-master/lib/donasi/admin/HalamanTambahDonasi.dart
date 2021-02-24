import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:hmtif/donasi/admin/models/DatabaseManager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.cyan),
    home: TambahDonasi(),
  ));
}

class TambahDonasi extends StatefulWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  _TambahDonasiState createState() => _TambahDonasiState();
}

class _TambahDonasiState extends State<TambahDonasi> {
  String namaDonasi, deskripsi, shortDeskripsi, gambarDonasi, kategori;
  int danaDonasi;
  getDonasiNama(namaDonasi) {
    this.namaDonasi = namaDonasi;
  }

  getDonasiDeskripsi(deskripsi) {
    this.deskripsi = deskripsi;
  }

  getDonasiShortDeskripsi(shortDeskripsi) {
    this.shortDeskripsi = shortDeskripsi;
  }


  getDonasiDana(danaDonasi) {
    this.danaDonasi = int.parse(danaDonasi);
  }

 getDonasiGambar(gambarDonasi) {
    this.gambarDonasi = gambarDonasi;
  }

 getDonasiKategori(kategori) {
    this.kategori = kategori;
  }

  Future<DocumentSnapshot> createData() async {
    await Firebase.initializeApp();
    DocumentReference documentReference =
        Firestore.instance.collection("Donasi").document();

    //createMap
    Map<String, dynamic> donasis = {
      "namaDonasi": namaDonasi,
      "deskripsi": deskripsi,
      "shortDeskripsi": shortDeskripsi,
      "danaDonasi": danaDonasi,
      "gambarDonasi": gambarDonasi,
      "kategori": kategori,
    };

    documentReference.setData(donasis).whenComplete(() {
      print("$namaDonasi created");
    });
  }

 

  @override
  void initState() {
    
    super.initState();
  }

  

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Halaman Tambah Donasi"),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Program Donasi",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String namaDonasi) {
                      getDonasiNama(namaDonasi);
                    },
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Short Deskripsi",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String shortDeskripsi) {
                      getDonasiShortDeskripsi(shortDeskripsi);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Deskripsi",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String deskripsi) {
                      getDonasiDeskripsi(deskripsi);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Dana yang dibutuhkan",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String danaDonasi) {
                      getDonasiDana(danaDonasi);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Kategori",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String kategori ) {
                      getDonasiKategori(kategori);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Gambar",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String gambarDonasi) {
                      getDonasiGambar(gambarDonasi);
                    },
                  ),
                ),
                
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Text("Create"),
                          textColor: Colors.white,
                          onPressed: () {
                            createData();
                          }),
                      
                    ],
                  ),
                ),
               
              ]),
            ),
          ),
        ));
  }
}
