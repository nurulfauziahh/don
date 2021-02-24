import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmtif/Animation/FadeAnimation.dart';
import 'package:hmtif/donasi/widgets/my_header.dart';
import 'package:hmtif/donasi/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:hmtif/donasi/details/details_screen.dart';

class KatSosial extends StatefulWidget {
final String namaDonasi, deskripsi, shortDeskripsi, gambarDonasi, documentId, kategori;
  final int danaDonasi;
  KatSosial({
    // @required this.isEdit,
    @required this.documentId,
    @required this.namaDonasi,
    @required this.deskripsi,
    @required this.shortDeskripsi,
    @required this.danaDonasi,
    @required this.gambarDonasi,
    @required this.kategori,
  });

  @override
  _KatSosialState createState() => _KatSosialState();
}

class _KatSosialState extends State<KatSosial> {
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
    return Scaffold(
      body:  SingleChildScrollView(
        controller : controller,
        child : Column (
          crossAxisAlignment : CrossAxisAlignment.start,
          children: <Widget>[
              Myheader(
              image: "assets/images/1.png",
              textTop : "Berkah nya",
              textBottom : "Donasi",
              offset : offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sosial",
                    style : kTitleTextstyle,
                  ),

                  SizedBox(height: 20),

          SingleChildScrollView(
                  child : Column(
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
                              controller : controller,
                              shrinkWrap: true,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot documentSnapshot =
                                    snapshot.data.documents[index];
                                Map<String, dynamic> task =
                                    documentSnapshot.data();
                                    if(documentSnapshot.data()['kategori'] == "sosial") {
                                        return FadeAnimation(
                                  1.8,
                                  GestureDetector(
                                    onTap: () async {
                                      bool result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return DetailDonasi(
                                            documentId:
                                                documentSnapshot.documentID,
                                            namaDonasi: task['namaDonasi'],
   
                                            danaDonasi: task['danaDonasi'],
                                            deskripsi: task['deskripsi'],
                                            kategori: task['kategori'],
           
                                          );
                                        }),
                                      );
                                    },
                                    child: InkWell(
                                      child: Container(
                                        
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Container(
                                            child: SizedBox(
                                        
                                              child: Stack(
                                                alignment: Alignment.centerLeft,
                                                children: <Widget>[
                                                  Container(
                                                    // height: 50,
                                                    // width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          offset: Offset(0, 8),
                                                          blurRadius: 24,
                                                          color: Colors.grey,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  
                                                  Padding(
                                                      padding: const EdgeInsets.only(bottom: 10),
                                                        child: Container(
                                                        child: SizedBox(
                                                          height: 156,
                                                          child: Stack(
                                                        alignment: Alignment.centerLeft,
                                                      children: <Widget>[
                                                        Container(
                                                   
                                                    height: 150,
                                                    width: double.infinity,
                                                    decoration : BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        color : Colors.white,
                                                        boxShadow: [
                                                        BoxShadow(
                                                          offset: Offset(0,8),
                                                          blurRadius: 24,
                                                          color : kShadowColor,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Image.asset("assets/images/wear_mask.png"),
                                                  Positioned(
                                                    left: 130,
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                                      height: 136,
                                                      width: MediaQuery.of(context).size.width - 160,
                                                      child : Column (
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children : <Widget>[
                                                          Text(
                                                            documentSnapshot.data()['namaDonasi'],
                                                            style: kTitleTextstyle.copyWith(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              documentSnapshot.data()['shortDeskripsi'],
                                                              //  documentSnapshot.data()['danaDonasi'].toString(),
                                                              maxLines : 4,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                          
                                                        
                                                            Row(
                                                              children: <Widget>[

                                                                new Text(
                                                                  "Dana yang terkumpul",
                                                                  style:
                                                                      TextStyle(color: Colors.grey, fontSize: 10),
                                                                ),
                                                              ],
                                                            ),
                                                          Text(
                                                              "RP. " + documentSnapshot.data()['danaDonasi'].toString(),
                                                              //  documentSnapshot.data()['danaDonasi'].toString(),
                                                              maxLines : 4,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(color: Colors.green,
                                                                fontSize: 12,
                                                            ), ), 
                                                             new Padding(padding: EdgeInsets.all(3)),
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
                                                                    width: 350 * 0.5,
                                                                    duration: Duration(milliseconds: 500),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.lightGreen,
                                                                        borderRadius: BorderRadius.circular(5)),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                         SizedBox(height: 10),
                                                        Align(
                                                          alignment: Alignment.topRight,
                                                                      child: SvgPicture.asset("assets/icons/forward.svg"),
                                                                    ),
                                                                    
                                                      ],
                                                            ),
                                                    ),
                                                    
                                                        ),
                                                        
                                                      ],
                                                      
                                                       ),
                                                       
                                                  ),
                                                  ),
                                      

                                                  )],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                                    }
                                
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
    ),);
  }
}


class SymptomCard extends StatelessWidget{

  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
          ? BoxShadow(
            offset: Offset(0,10),
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
          Image.asset(image, height:90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
