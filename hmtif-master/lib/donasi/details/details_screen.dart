// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hmtif/donasi/details/transaksi.dart';
import 'package:hmtif/donasi/info_screen.dart';
import 'package:hmtif/Animation/FadeAnimation.dart';

class DetailDonasi extends StatefulWidget {
  // final DocumentSnapshot MyStudent;
  // DetailDonasi({this.MyStudent});
  final String namaDonasi,
      deskripsi,
      documentId,
      kategori,
      gambarDonasi;
  final int danaDonasi, danaTerkumpul;
  // final int danaDonasi;
  DetailDonasi({
    // @required this.isEdit,
    @required this.documentId,
    @required this.namaDonasi,
    @required this.deskripsi,
    @required this.danaDonasi,
    @required this.danaTerkumpul,
    @required this.kategori,
    @required this.gambarDonasi,
  });
  @override
  _DetailDonasiState createState() => _DetailDonasiState();
}

class _DetailDonasiState extends State<DetailDonasi> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final progress = widget.danaTerkumpul;
    var delay = 1.5;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeAnimation(
                        1,
                        Container(
                          child: Image.network(widget.gambarDonasi.toString(),
                              // width: 300,
                              height: 150,
                              fit: BoxFit.fill),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1.5,
                        Text(
                          widget.namaDonasi,
                          style: TextStyle(
                              color: Color.fromRGBO(49, 39, 79, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    // Text(
                    //   "Dana terkumpul",
                    //           style:
                    //               TextStyle(color: Colors.grey, fontSize: 10),
                    // ),
                    FadeAnimation(
                        1.5,
                        Row(
                          children: <Widget>[
                            new Text(
                              "Rp." +  widget.danaTerkumpul.toString() +" dana terkumpul dari Rp."+
                                  widget.danaDonasi.toString(),
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ],
                        )),
                    new Padding(padding: EdgeInsets.all(3)),
                    FadeAnimation(
                        1.5,
                        Stack(
                          children: <Widget>[
                            Container(
                              width: 350,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(5),
                              child: AnimatedContainer(
                                height: 10,
                                width: progress * 0.5,
                                duration: Duration(milliseconds: 500),
                                decoration: BoxDecoration(
                                    color: Colors.lightGreen,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            )
                          ],
                        )),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),

                    FadeAnimation(
                        1.5,
                        Stack(
                          children: <Widget>[
                            new Text(
                              "kategori : " + widget.kategori,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            )
                          ],
                        )),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    FadeAnimation(
                        1.5,
                        Text(
                          "Deskripsi",
                          style: TextStyle(
                              color: Color.fromRGBO(49, 39, 79, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    FadeAnimation(
                        1.5,
                        Text(
                          widget.deskripsi,
                          style: TextStyle(
                              color: Color.fromRGBO(49, 39, 79, 1),
                              fontSize: 12),
                        )),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),

                    FadeAnimation(
                        2,
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new Transaksi(
                                      documentId: widget.documentId,
                                      namaDonasi: widget.namaDonasi,
                                      danaDonasi: widget.danaDonasi,
                                      danaTerkumpul: widget.danaTerkumpul,
                                      deskripsi: widget.deskripsi,
                                      kategori: widget.kategori,
                                      gambarDonasi: widget.gambarDonasi,
                                    )));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Center(
                              child: Text(
                                "Donasi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),

//BUTTON
                    // FadeAnimation(
                    //     2,
                    //     GestureDetector(
                    //       onTap: () {
                    //         String documentId = widget.documentId;
                    //         String namaDonasi = widget.namaDonasi;
                    //         String deskripsi = widget.deskripsi;
                    //         String kategori = widget.kategori;
                    //         String gambarDonasi = widget.gambarDonasi.toString();

                    //         int danaDonasi =
                    //             int.parse(widget.danaDonasi.toString());
                    //         DocumentReference documentReference =
                    //             FirebaseFirestore.instance
                    //                 .collection("Donasi")
                    //                 .document(documentId);
                    //         Map<String, dynamic> students = {
                    //           "namaDonasi": namaDonasi,
                    //           "deskripsi": deskripsi,
                    //           "danaDonasi": danaDonasi + 1,
                    //         };

                    //         documentReference
                    //             .setData(students)
                    //             .whenComplete(() {
                    //           print("$namaDonasi updated");
                    //         });
                    //         showDialog(
                    //             context: context,
                    //             builder: (BuildContext context) {
                    //               return AlertDialog(
                    //                 title: Text(
                    //                     'Terimakasih sudah menyetujui aspirasi dan keluhan ini,silahkan liat aspirasi dan keluhan yang lain'),
                    //                 actions: <Widget>[
                    //                   FlatButton(
                    //                     child: Text('OK'),
                    //                     onPressed: () {
                    //                       Navigator.of(context).push(
                    //                           new MaterialPageRoute(
                    //                               builder:
                    //                                   (BuildContext context) =>
                    //                                       new DetailDonasi()));
                    //                     },
                    //                   ),
                    //                 ],
                    //               );
                    //             });
                    //       },
                    //       child: Container(
                    //         height: 50,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             gradient: LinearGradient(colors: [
                    //               Color.fromRGBO(143, 148, 251, 1),
                    //               Color.fromRGBO(143, 148, 251, .6),
                    //             ])),
                    //         child: Center(
                    //           child: Text(
                    //             "Donasi",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ),
                    //       ),
                    //     )
                    //     ),
                    // END BUTTON
                  ]),
            ),
            // FadeAnimation(
            //     1.8,
            //     Card(
            //         child: ListTile(
            //             title: Text(widget.MyStudent.data()["name"])))),
          ],
        ),
      ),
    );
  }
}
