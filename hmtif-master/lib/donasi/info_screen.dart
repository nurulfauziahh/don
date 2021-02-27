import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmtif/Animation/FadeAnimation.dart';
import 'package:hmtif/donasi/kategori/kat_akademik.dart';
import 'package:hmtif/donasi/widgets/camp_card.dart';
import 'package:hmtif/donasi/widgets/my_header.dart';
import 'package:hmtif/donasi/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../HalamanDetailAspirasi.dart';
import '../HalamanTambahAspirasi.dart';
import 'details/details_screen.dart';
import 'kategori/campaign_categories.dart';
import 'kategori/kat_sosial.dart';

class InfoScreen extends StatefulWidget {
  final String namaDonasi,
      deskripsi,
      shortDeskripsi,
      gambarDonasi,
      documentId,
      kategori;
  final int danaDonasi, danaTerkumpul;
  InfoScreen({
    // @required this.isEdit,
    @required this.documentId,
    @required this.namaDonasi,
    @required this.deskripsi,
    @required this.shortDeskripsi,
    @required this.danaDonasi,
    @required this.danaTerkumpul,
    @required this.gambarDonasi,
    @required this.kategori,
  });

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Myheader(
            image: "assets/images/1.png",
            textTop: "Berkah nya",
            textBottom: "Donasi",
            offset: offset,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Category",
                  style: kTitleTextstyle,
                ),
                SizedBox(height: 10),
                CampaignCategories(), //CARD CATEGORY
                SizedBox(height: 10),

// berdasarkan kategori belum jalan

                //   Row(
                //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       SizedBox(width: 25),
                //         Row(
                //           children: <Widget>[
                //          GestureDetector(
                //              onTap: () {
                //   Navigator.of(context).push(
                //     new MaterialPageRoute(
                //       builder: (BuildContext context) =>
                //           new KatAkademik()));
                // },
                //          ),
                //         SymptomCard(
                //         image: "assets/images/kSosial.png",
                //         title: "Sosial",
                //       ),
                //         ],
                //         ),

                //       SizedBox(width: 10,),

                //       Row(
                //           children: <Widget>[
                //           FlatButton(onPressed: () {
                //             Navigator.push(
                //               context,
                //              new  MaterialPageRoute(builder: (context) => new KatAkademik()),
                //             );
                //           }),
                //          SymptomCard(
                //         image: "assets/images/kAkademik.png",
                //         title: "Akademik",
                //         isActive: true,
                //       ),
                //         ],
                //         ),

                //      SizedBox(width: 10,),
                //     ],
                //   ),

                SizedBox(height: 20),
                Text("Recent", style: kTitleTextstyle),

                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SingleChildScrollView(
                        controller: controller,
                        child: StreamBuilder(
                          stream: Firestore.instance
                              .collection("Donasi")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                controller: controller,
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot documentSnapshot =
                                      snapshot.data.documents[index];
                                  Map<String, dynamic> task =
                                      documentSnapshot.data();
                                  return FadeAnimation(
                                    1.8,
                                    GestureDetector(
                                      child: InkWell(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Container(
                                              child: SizedBox(
                                                child: Stack(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: <Widget>[
                                                    Container(
                                                      margin:
                                                          EdgeInsets.all(8.0),
                                                      child: Card(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        8.0))),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            bool result =
                                                                await Navigator
                                                                    .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                                return DetailDonasi(
                                                                  documentId:
                                                                      documentSnapshot
                                                                          .documentID,
                                                                  namaDonasi: task[
                                                                      'namaDonasi'],
                                                                  deskripsi: task[
                                                                      'deskripsi'],
                                                                  danaDonasi: task[
                                                                      'danaDonasi'],
                                                                      danaTerkumpul: task[
                                                                      'danaTerkumpul'],
                                                                  gambarDonasi:
                                                                      task[
                                                                          'gambarDonasi'],
                                                                  kategori: task[
                                                                      'kategori'],
                                                                );
                                                              }),
                                                            );
                                                          },
                                                          child: Column(
                                                            children: <Widget>[
                                                              CampCard(
                                                                image: documentSnapshot
                                                                    .data()[
                                                                        'gambarDonasi']
                                                                    .toString(),
                                                                title: documentSnapshot
                                                                        .data()[
                                                                    'namaDonasi'],
                                                                subtitle: "Rp. " + documentSnapshot
                                                                        .data()[
                                                                            'danaTerkumpul']
                                                                        .toString() +" Terkumpul dari Rp."+
                                                                    documentSnapshot
                                                                        .data()[
                                                                            'danaDonasi']
                                                                        .toString(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Container(

                // ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String onpres;
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.onpres,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
