// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hmtif/HalamanAspirasi.dart';

import 'package:hmtif/Animation/FadeAnimation.dart';
import 'package:hmtif/donasi/constant.dart';
import 'package:hmtif/donasi/controller/Controller.dart';
import 'package:hmtif/donasi/details/details_screen.dart';
import 'package:hmtif/donasi/info_screen.dart';
import 'package:hmtif/donasi/model/Model.dart';
import 'package:hmtif/donasi/widgets/rounded_container.dart';
import 'package:intl/intl.dart';

class Transaksi extends StatefulWidget {
  final String namaDonasi, deskripsi, gambarDonasi, documentId, kategori;
  final int danaDonasi, danaTerkumpul;
  Transaksi({
    // @required this.isEdit,
    @required this.documentId,
    @required this.namaDonasi,
    @required this.deskripsi,
    @required this.danaDonasi,
    @required this.danaTerkumpul,
    @required this.gambarDonasi,
    @required this.kategori,
  });
  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  int totalAmount = 0;
  String  namaDoantur, nomor;
  var txt = TextEditingController();
  ControllerData controller = new ControllerData();
  
  // getDonaturNamaDonatur(namaDonatur) {
  //   this.namaDoantur= namaDoantur;
  // }

  getDonaturNomor(nomor) {
    this.nomor = nomor;
  }

  getDonasiTotalAmount(totalAmount) {
    this.totalAmount = int.parse(totalAmount);
  }

  Future<DocumentSnapshot> createData() async {
    await Firebase.initializeApp();
    DocumentReference documentReference =
        Firestore.instance.collection("Donatur").document();

    //createMap
    Map<String, dynamic> donasi = {
      "nomor": nomor,
      "totalAmount": totalAmount,
    };

    documentReference.setData(donasi).whenComplete(() {
      print("$nomor created");
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Text(
              "Pilih Nominal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            FadeAnimation(
              2,
              Row(
                children: <Widget>[
                  Expanded(
                    child: RoundedContainer(
                      color: kExpandedColor,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                              child: Text(
                                 "Rp. 10.000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                              onPressed: () {
                                // txt.text = NumberFormat.currency(
                                //         locale: 'id',
                                //         symbol: 'Rp. ',
                                //         decimalDigits: 0)
                                //     .format(10000);
                                txt.text = "10000";
                              }),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: RoundedContainer(
                      color: kExpandedColor,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                              child: Text(
                                  "Rp. 20.000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                              onPressed: () {
                                txt.text = "20000";
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FadeAnimation(
              2,
              Row(
                children: <Widget>[
                  Expanded(
                    child: RoundedContainer(
                      color: kExpandedColor,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                              child: Text(
                                  // NumberFormat.currency(
                                  //         locale: 'id',
                                  //         symbol: 'Rp. ',
                                  //         decimalDigits: 0)
                                  //     .format(50000),
                                  "Rp.50.000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                              onPressed: () {
                                txt.text = "50000";
                              }),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: RoundedContainer(
                      color: kExpandedColor,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                              child: Text(
                                  "Rp. 50.0000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                              onPressed: () {
                                txt.text = "50000";
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            // icon payment
            // FadeAnimation(
            //   2,
            //    Column(
            //      children: <Widget>[
            //         RoundedContainer(
            //   margin: const EdgeInsets.all(8.0),
            //   padding: const EdgeInsets.all(8.0),
            //   child: ListTile(
            //     leading: Icon(
            //      FontAwesomeIcons.paypal,
            //       color: Colors.indigo,
            //     ),
            //     title: Text("Paypal"),
            //     trailing: Icon(Icons.arrow_forward_ios),
            //     ),
            // ),
            // RoundedContainer(
            //   margin: const EdgeInsets.all(8.0),
            //   padding: const EdgeInsets.all(8.0),
            //   child: ListTile(
            //     leading: Icon(
            //      FontAwesomeIcons.googleWallet,
            //       color: Colors.indigo,
            //     ),
            //     title: Text("Google Pay"),
            //     trailing: Icon(Icons.arrow_forward_ios),
            //     ),
            // ),
            //  RoundedContainer(
            //   margin: const EdgeInsets.all(8.0),
            //   padding: const EdgeInsets.all(8.0),
            //   child: ListTile(
            //     leading: Icon(
            //      FontAwesomeIcons.applePay,
            //       color: Colors.indigo,
            //     ),
            //     title: Text("Apple Pay"),
            //     trailing: Icon(Icons.arrow_forward_ios),
            //     ),
            // ),
            //      ],
            //    ),

            // ),
            Text(
              "Nomor Hp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            RoundedContainer(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LimitedBox(
                    maxWidth: 150.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Masukkan Nomor Hp",
                      ),
                      onChanged: (String nomor){
                        getDonaturNomor(nomor);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Jumlah nominal lainnya",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            RoundedContainer(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LimitedBox(
                    maxWidth: 150.0,
                    child: TextField(
                      controller: txt,
                      keyboardType: TextInputType.number,
                      //Tidak bisa insert pakai currency
                      // inputFormatters: [
                      //   CurrencyTextInputFormatter(
                      //       locale: 'id', decimalDigits: 0, symbol: 'Rp. ')
                      // ],
                      decoration: InputDecoration(
                        hintText: "Masukkan nominal",
                      ),
                      onChanged: (String value) {
                      
                        setState(() {
                        controller: txt.text;
                          totalAmount = num.parse(value);
                         
                          getDonasiTotalAmount(totalAmount);
                        });
                      
                        int g = num.parse(txt.text);
                        getDonasiTotalAmount(txt.text);
                      },
                      // onChanged: (String totalAmount){
                      //   int.parse(totalAmount);
                      //   getDonasiTotalAmount(totalAmount);
                      // },
                    ),
                  ),
                ],
              ),
            ),

            // Container(
            //   width: double.infinity,
            //   padding:  const EdgeInsets.symmetric(
            //     vertical : 16.0,
            //     horizontal : 32.0,
            //   ),
            //   child: RaisedButton(
            //     elevation: 0,
            //     padding : const EdgeInsets.all(24.0),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10.0)),
            //     child: Text("Continue"),
            //     color: Colors.indigo,
            //     textColor: Colors.white,
            //     onPressed: () {

            //     },
            //   ),
            // ),
            FadeAnimation(
                2,
                GestureDetector(
                  onTap: () {
                    String documentId = widget.documentId;
                    String namaDonasi = widget.namaDonasi;
                    String deskripsi = widget.deskripsi;
                    String kategori = widget.kategori;
                    String gambarDonasi = widget.gambarDonasi;
                    int danaDonasi = int.parse(widget.danaDonasi.toString());
                    int danaTerkumpul = int.parse(widget.danaTerkumpul.toString());

                   
                    DocumentReference documentReference =
                        FirebaseFirestore.instance
                            .collection("Donasi")
                            .document(documentId);
                    Map<String, dynamic> students = {
                      "namaDonasi": namaDonasi,
                      "deskripsi": deskripsi,
                      "danaDonasi" : danaDonasi,
                      "kategori" : kategori,
                      "gambarDonasi" : gambarDonasi,
                      "danaTerkumpul": danaTerkumpul + totalAmount,
                    };

                    documentReference
                        .setData(students)
                        .whenComplete(() {
                      print("$namaDonasi updated");
                    });

                    // DocumentReference documentReference2 =
                    //     FirebaseFirestore.instance
                    //         .collection("Donasi")
                    //         .document(documentId);
                    // Map<String, dynamic> student = {
                    //   "namaDonasi": namaDonasi,
                    //   "deskripsi": deskripsi,
                    //   "danaDonasi": danaDonasi + 1,
                    // };

                    // documentReference
                    //     .setData(students)
                    //     .whenComplete(() {
                    //   print("$namaDonasi updated");
                    // });
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                                'Terimakasih sudah berdonasi'),
                            actions: <Widget>[
                              RaisedButton(
                                child: Text('OK'),
                                onPressed: () {
                                  controller.createData(nomor, totalAmount);
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder:
                                              (BuildContext context) =>
                                                  new InfoScreen()));
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kThemeColor,
                    ),
                    child: Center(
                      child: Text(
                        "Donasi",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 10.0,
            ),
          ]),
        ));
  }
}
