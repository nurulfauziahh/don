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
    home: EditDonasi(),
  ));
}

class EditDonasi extends StatefulWidget {
  final String namaDonasi, deskripsi, shortDeskripsi, gambarDonasi, documentId, kategori;
  // final bool isEdit;
  final int danaDonasi;

  EditDonasi({
    // @required this.isEdit,
    @required this.documentId,
    @required this.namaDonasi,
    @required this.deskripsi,
    @required this.shortDeskripsi,
    @required this.danaDonasi,
    @required this.gambarDonasi,
    @required this.kategori,
  });
  
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  _EditDonasiState createState() => _EditDonasiState();
}

class _EditDonasiState extends State<EditDonasi> {
  TextEditingController controllerNamaDonasi = TextEditingController();
  TextEditingController controllerDeskripsi = TextEditingController();
  TextEditingController controllerShortDeskripsi = TextEditingController();
  TextEditingController controllerGambarDonasi = TextEditingController();
  TextEditingController controllerDanaDonasi = TextEditingController();
  TextEditingController controllerKategori = TextEditingController();
  String name, studentId, studyProgramId;
  double studentGpa;
  getStudentName(name) {
    this.name = name;
  }

  getStudentId(studentId) {
    this.studentId = studentId;
  }

  getStudyProgramId(studyProgramId) {
    this.studyProgramId = studyProgramId;
  }

  getStudentGpa(studentGpa) {
    this.studentGpa = double.parse(studentGpa);
  }

  @override
  void initState() {
    
    super.initState();
    
    controllerNamaDonasi.text = widget.namaDonasi.toString();
    controllerDeskripsi.text = widget.deskripsi.toString();
    controllerShortDeskripsi.text = widget.shortDeskripsi.toString();
    controllerGambarDonasi.text = widget.gambarDonasi.toString();
    controllerDanaDonasi.text = widget.danaDonasi.toString();
    controllerKategori.text = widget.kategori.toString();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Halaman Edit Donasi"),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    controller: controllerNamaDonasi,
                    decoration: InputDecoration(
                        labelText: "Donasi",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String namaDonasi) {
                      getStudentName(name);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    controller: controllerDeskripsi,
                    decoration: InputDecoration(
                        labelText: "Deskripsi",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0))),
                    onChanged: (String studentId) {
                      getStudentId(studentId);
                    },
                  ),
                ),
               
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      
                      RaisedButton(
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Text("Update"),
                          textColor: Colors.white,
                          onPressed: () async {
                            FirebaseFirestore _firestore =
                                FirebaseFirestore.instance;

                            //updateData();
                            String documentId = widget.documentId;
                            String namaDonasi = controllerNamaDonasi.text;
                            String deskripsi = controllerDeskripsi.text;
                            String shortDeskripsi = controllerShortDeskripsi.text;
                            String gambarDonasi = controllerGambarDonasi.text;
                            String kategori = controllerKategori.text;
                            int danaDonasi = widget.danaDonasi;
                            
                            DocumentReference documentReference =
                                FirebaseFirestore.instance
                                    .collection("Donasi")
                                    .document(
                                        documentId);
                            Map<String, dynamic> donasis = {
                              "namaDonasi": namaDonasi,
                              "deskripsi": deskripsi,
                              "shortDeskripsi": shortDeskripsi,
                              "gambarDonasi": gambarDonasi,
                              "danaDonasi": danaDonasi,
                              "kategori": kategori,
                            };

                            documentReference
                                .setData(donasis)
                                .whenComplete(() {
                              print("$namaDonasi updated");
                            });
                           
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
