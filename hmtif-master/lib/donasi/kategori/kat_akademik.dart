import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmtif/Animation/FadeAnimation.dart';
import 'package:hmtif/donasi/widgets/my_header.dart';
import 'package:hmtif/donasi/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:hmtif/donasi/details/details_screen.dart';

class KatAkademik extends StatefulWidget {
final String namaDonasi, deskripsi, shortDeskripsi, gambarDonasi, documentId, kategori;
  final int danaDonasi;
  KatAkademik({
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
  _KatAkademikState createState() => _KatAkademikState();
}

class _KatAkademikState extends State<KatAkademik> {
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
                    "Akademik",
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
                                        // onTap: () async {
                                        //   bool result = await Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) {
                                        //       return DetailDonasi(
                                        //         documentId:
                                        //             documentSnapshot.documentID,
                                        //         namaDonasi: task['namaDonasi'],
                                        //         deskripsi: task['deskripsi'],
                                        //         danaDonasi: task['danaDonasi'],
                                        //       );
                                        //     }),
                                        //   );
                                        // },
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
                                                          margin:EdgeInsets.all(8.0),
                                                          child: Card(
                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                                            child: InkWell(
                                                              onTap: () async {
                                          bool result = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return DetailDonasi(
                                                documentId:
                                                    documentSnapshot.documentID,
                                                namaDonasi: task['namaDonasi'],
                                                deskripsi: task['deskripsi'],
                                                danaDonasi: task['danaDonasi'],
                                                gambarDonasi: task['gambarDonasi'],
                                                kategori: task['kategori'],

                                                
                                              );
                                            }),
                                          );
                                        },
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                                                                children: <Widget>[
                                                                  ClipRRect(
                                                                    borderRadius: BorderRadius.only(
                                                                      topLeft: Radius.circular(8.0),
                                                                      topRight: Radius.circular(8.0),
                                                                    ),
                                                                    child: Image.network(
                                                                        documentSnapshot.data()['gambarDonasi'].toString(),
                                                                      // width: 300,
                                                                        height: 150,
                                                                        fit:BoxFit.fill

                                                                    ),
                                                                  ),
                                                                  ListTile(
                                                                    title: Text(documentSnapshot.data()['namaDonasi']),
                                                                    subtitle: Text("Rp. "+documentSnapshot.data()['danaDonasi'].toString()),
                                                                  ),
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
                                                                ),
                                                                SizedBox(height: 20),
                                                              ],
                                                            ),
                                                              ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                                                                        
                                                  // Container(
                                                  //   // height: 50,
                                                  //   // width: double.infinity,
                                                  //   decoration: BoxDecoration(
                                                  //     borderRadius:
                                                  //         BorderRadius.circular(
                                                  //             20),
                                                  //     color: Colors.white,
                                                  //     boxShadow: [
                                                  //       BoxShadow(
                                                  //         offset: Offset(0, 8),
                                                  //         blurRadius: 24,
                                                  //         color: Colors.grey,
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                  
                                                  // Padding(
                                                  //     padding: const EdgeInsets.only(bottom: 10),
                                                  //       child: Container(
                                                  //       child: SizedBox(
                                                  //         height: 156,
                                                  //         child: Stack(
                                                  //       alignment: Alignment.centerLeft,
                                                  //     children: <Widget>[
                                                  //       Container(
                                                   
                                                  //   height: 150,
                                                  //   width: double.infinity,
                                                  //   decoration : BoxDecoration(
                                                  //       borderRadius: BorderRadius.circular(20),
                                                  //       color : Colors.white,
                                                  //       boxShadow: [
                                                  //       BoxShadow(
                                                  //         offset: Offset(0,8),
                                                  //         blurRadius: 24,
                                                  //         color : kShadowColor,
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                  // // Container(
                                                  // //     height: 120.0,
                                                  // //     width: 120.0,
                                                  // //     decoration: BoxDecoration(
                                                  // //       image: DecorationImage(
                                                  // //        Image.network(documentSnapshot.data()['gambarDonasi'].toString()),
                                                  // //         fit: BoxFit.fill,
                                                  // //       ),
                                                  // //       shape: BoxShape.circle,
                                                  // //     ),
                                                  // //   ),
                                                  // Image.network(documentSnapshot.data()['gambarDonasi'].toString(), fit:BoxFit.fill),
                                                  // Positioned(
                                                  //   left: 130,
                                                  //   child: Container(
                                                  //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                                  //     height: 136,
                                                  //     width: MediaQuery.of(context).size.width - 170,
                                                  //     child : Column (
                                                  //       crossAxisAlignment: CrossAxisAlignment.start,
                                                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  //       children : <Widget>[
                                                  //         Text(
                                                  //           documentSnapshot.data()['namaDonasi'],
                                                            
                                                  //           style: kTitleTextstyle.copyWith(
                                                  //             fontSize: 16,
                                                  //           ),
                                                  //         ),
                                                          
                                                        
                                                  //           Row(
                                                  //             children: <Widget>[

                                                  //               new Text(
                                                  //                 "Dana yang terkumpul",
                                                  //                 style:
                                                  //                     TextStyle(color: Colors.grey, fontSize: 10),
                                                  //               ),
                                                  //             ],
                                                  //           ),
                                                            
                                                  //         Text(
                                                            
                                                  //             "Rp. " + documentSnapshot.data()['danaDonasi'].toString(),
                                                  //             //  documentSnapshot.data()['danaDonasi'].toString(),
                                                              
                                                  //             maxLines : 4,
                                                  //             overflow: TextOverflow.ellipsis,
                                                  //             style: TextStyle(color: Colors.green,
                                                  //               fontSize: 12,
                                                  //           ), ), 
                                                  //            new Padding(padding: EdgeInsets.all(3)),
                                                  //           Stack(
                                                  //             children: <Widget>[
                                                  //               Container(
                                                  //                 width: 350,
                                                  //                 height: 10,
                                                  //                 decoration: BoxDecoration(
                                                  //                     color: Colors.grey[200],
                                                  //                     borderRadius: BorderRadius.circular(5)),
                                                  //               ),
                                                  //               Material(
                                                  //                 borderRadius: BorderRadius.circular(5),
                                                  //                 child: AnimatedContainer(
                                                  //                   height: 10,
                                                  //                   width: 350 * 0.5,
                                                  //                   duration: Duration(milliseconds: 500),
                                                  //                   decoration: BoxDecoration(
                                                  //                       color: Colors.lightGreen,
                                                  //                       borderRadius: BorderRadius.circular(5)),
                                                  //                 ),
                                                  //               )
                                                  //             ],
                                                  //           ),
                                                  //        SizedBox(height: 10),
                                                  //       Align(
                                                  //         alignment: Alignment.topRight,
                                                  //                     child: SvgPicture.asset("assets/icons/forward.svg"),
                                                  //                   ),
                                                                    
                                                  //     ],
                                                  //           ),
                                                  //   ),
                                                    
                                                  //       ),
                                                        
                                                  //     ],
                                                      
                                                  //      ),
                                                       
                                                  // ),
                                                  // ),
                                      

                                                  // )
                                                  ],  
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

// class Aspirasi extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var child2 = null;

//   }
// }


// class _InfoScreenState extends State<InfoScreen> {

//   final controller = ScrollController();
//   double offset = 0;

//   @override
//   void initState() {
//     super.initState();
//     controller.addListener(onScroll);
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   void onScroll() {
//     setState(() {
//       offset = (controller.hasClients) ? controller.offset : 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  SingleChildScrollView(
//         controller : controller,
//         child : Column (
//           crossAxisAlignment : CrossAxisAlignment.start,
//           children: <Widget>[
//             Myheader(
//               image: "assets/images/1.png",
//               textTop : "Berkah nya",
//               textBottom : "Donasi",
//               offset : offset,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal : 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Category",
//                     style : kTitleTextstyle,
//                   ),
//                   SizedBox(height: 20,),
//                   SingleChildScrollView(
//                     scrollDirection : Axis.horizontal,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         SizedBox(width: 25),
//                         SymptomCard(
//                           image: "assets/images/kAkademik.png",
//                           title: "Akademik",
//                           isActive: true,
//                         ),
//                         SizedBox(width: 20,),
//                         SymptomCard(
//                           image: "assets/images/kSosial.png",
//                           title: "Sosial",
//                         ),
                       
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text("Recent", style : kTitleTextstyle),
//                   SizedBox(height: 20),

//                 SingleChildScrollView(
//                    controller : controller,
//                         scrollDirection : Axis.vertical,
                        
//                         child: Column(
//                           children: <Widget>[
//                               StreamBuilder(
//                                 stream:
//                                     Firestore.instance.collection("Donasi").snapshots(),
//                                 builder: (context, snapshot) {
//                                     if (snapshot.hasData) {
//                                       return SingleChildScrollView(
                                        
//                                             child: ListView.builder(
//                                                 controller : controller,
//                                                 shrinkWrap: true,
//                                                 itemCount: snapshot.data.documents.length,
//                                                 itemBuilder: (context, index) {
                                                  
//                                                       DocumentSnapshot documentSnapshot =
//                                                           snapshot.data.documents[index];
//                                                       Map<String, dynamic> task = documentSnapshot.data();

//                                                     InkWell(
//                                                      child:  Container(
//                                                      return Padding(
//                                                       padding: const EdgeInsets.only(bottom: 10),
//                                                         child: Container(
//                                                         child: SizedBox(
//                                                           height: 156,
//                                                           child: Stack(
//                                                         alignment: Alignment.centerLeft,
//                                                       children: <Widget>[
//                                                         Container(
                                                   
//                                                     height: 136,
//                                                     width: double.infinity,
//                                                     decoration : BoxDecoration(
//                                                         borderRadius: BorderRadius.circular(20),
//                                                         color : Colors.white,
//                                                         boxShadow: [
//                                                         BoxShadow(
//                                                           offset: Offset(0,8),
//                                                           blurRadius: 24,
//                                                           color : kShadowColor,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Image.asset("assets/images/wear_mask.png"),
//                                                   Positioned(
//                                                     left: 130,
//                                                     child: Container(
//                                                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                                                       height: 136,
//                                                       width: MediaQuery.of(context).size.width - 170,
//                                                       child : Column (
//                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                         children : <Widget>[
//                                                           Text(
//                                                             documentSnapshot.data()['namaDonasi'],
//                                                             style: kTitleTextstyle.copyWith(
//                                                               fontSize: 16,
//                                                             ),
//                                                           ),
//                                                           Expanded(
//                                                             child: Text(
//                                                               documentSnapshot.data()['shortDeskripsi'],
//                                                               //  documentSnapshot.data()['danaDonasi'].toString(),
//                                                               maxLines : 4,
//                                                               overflow: TextOverflow.ellipsis,
//                                                               style: TextStyle(
//                                                                 fontSize: 12,
//                                                               ),
//                                                             ),
//                                                           ),
                                                          
                                                        
//                                                             Row(
//                                                               children: <Widget>[

//                                                                 new Text(
//                                                                   "Dana yang terkumpul",
//                                                                   style:
//                                                                       TextStyle(color: Colors.grey, fontSize: 10),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           Text(
//                                                               documentSnapshot.data()['danaDonasi'].toString(),
//                                                               //  documentSnapshot.data()['danaDonasi'].toString(),
//                                                               maxLines : 4,
//                                                               overflow: TextOverflow.ellipsis,
//                                                               style: TextStyle(color: Colors.green,
//                                                                 fontSize: 12,
//                                                             ), ), 
//                                                              new Padding(padding: EdgeInsets.all(3)),
//                                                             Stack(
//                                                               children: <Widget>[
//                                                                 Container(
//                                                                   width: 350,
//                                                                   height: 10,
//                                                                   decoration: BoxDecoration(
//                                                                       color: Colors.grey[200],
//                                                                       borderRadius: BorderRadius.circular(5)),
//                                                                 ),
//                                                                 Material(
//                                                                   borderRadius: BorderRadius.circular(5),
//                                                                   child: AnimatedContainer(
//                                                                     height: 10,
//                                                                     width: 350 * 0.5,
//                                                                     duration: Duration(milliseconds: 500),
//                                                                     decoration: BoxDecoration(
//                                                                         color: Colors.lightGreen,
//                                                                         borderRadius: BorderRadius.circular(5)),
//                                                                   ),
//                                                                 )
//                                                               ],
//                                                             ),
//                                                          SizedBox(height: 10),
//                                                         Align(
//                                                           alignment: Alignment.topRight,
//                                                                       child: SvgPicture.asset("assets/icons/forward.svg"),
//                                                                     ),
                                                                    
//                                                       ],
//                                                             ),
//                                                     ),
                                                    
//                                                         ),
                                                        
//                                                       ],
                                                      
//                                                        ),
                                                       
//                                                   ),
//                                                   ),
                                                
                                                      
//                                                   ),
//                                                   onTap: () async {
//                                                     bool result = await Navigator.push(
//                                                       context,
//                                                         MaterialPageRoute(
//                                                             builder: (context) {
//                                                           return DetailDonasi(
//                                                             documentId:
//                                                                 documentSnapshot.documentID,
//                                                             namaDonasi: task['namaDonasi'],
//                                                             shortDeskripsi: task['shortDeskripsi'],
//                                                             danaDonasi: task['danaDonasi'],
//                                               );
//                                             }), 
//                                           );
//                                                   }),);
                                              
//                                                 },
                                                
//                                               ),
                                              
//                                           );
                                          
                                             
//                                         }
                                        
//                                     },
                            
//                       ),
//                       ],
                      
//                     ),
                    
//                 ),

                
                
               
//                 SizedBox(height: 50),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// class PreventCard extends StatelessWidget {
//   final String image;
//   final String title;
//   final String text;
//   const PreventCard({
//     Key key,
//     this.image,
//     this.title,
//     this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 10),
//         child: SizedBox(
//           height: 156,
//           child: Stack(
//             alignment: Alignment.centerLeft,
//             children: <Widget>[
//               Container(
//                 height: 136,
//                 width: double.infinity,
//                 decoration : BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color : Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         offset: Offset(0,8),
//                         blurRadius: 24,
//                         color : kShadowColor,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Image.asset(image),
//                 Positioned(
//                   left: 130,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                     height: 136,
//                     width: MediaQuery.of(context).size.width - 170,
//                     child : Column (
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children : <Widget>[
//                         Text(
//                           title,
//                           style: kTitleTextstyle.copyWith(
//                             fontSize: 16,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             text,
//                             maxLines : 4,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: SvgPicture.asset("assets/icons/forward.svg"),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       );
//     }
//   }


// class SymptomCard extends StatelessWidget{

//   final String image;
//   final String title;
//   final bool isActive;
//   const SymptomCard({
//     Key key,
//     this.image,
//     this.title,
//     this.isActive = false,
//   }) : super(key : key);

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       padding: EdgeInsets.all(10),
//       decoration:  BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.white,
//         boxShadow: [
//           isActive
//           ? BoxShadow(
//             offset: Offset(0,10),
//             blurRadius: 20,
//             color: kActiveShadowColor,
//           )
//           : BoxShadow(
//             offset: Offset(0, 3),
//             blurRadius: 6,
//             color: kShadowColor,
//           ),
//         ],
//       ),
//       child: Column(
//         children: <Widget>[
//           Image.asset(image, height:90),
//           Text(
//             title,
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }


//import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:hmtif/donasi/widgets/my_header.dart';
// import 'package:hmtif/donasi/constant.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:hmtif/Animation/FadeAnimation.dart';
// import 'details/details_screen.dart';
// import 'package:hmtif/HalamanDetailAspirasi.dart';
// import 'package:hmtif/HalamanEditAspirasi.dart';
// import 'package:hmtif/HalamanTambahAspirasi.dart';

// class InfoScreen extends StatefulWidget {
// final String namaDonasi, deskripsi, shortDeskripsi, gambarDonasi, documentId;
//   final int danaDonasi;
//   InfoScreen({
//     // @required this.isEdit,
//     @required this.documentId,
//     @required this.namaDonasi,
//     @required this.deskripsi,
//     @required this.shortDeskripsi,
//     @required this.danaDonasi,
//     @required this.gambarDonasi,
//   });

//   @override
//   _InfoScreenState createState() => _InfoScreenState();
// }


// class _InfoScreenState extends State<InfoScreen> {

//   final controller = ScrollController();
//   double offset = 0;

//   @override
//   void initState() {
//     super.initState();
//     controller.addListener(onScroll);
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   void onScroll() {
//     setState(() {
//       offset = (controller.hasClients) ? controller.offset : 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  SingleChildScrollView(
//         controller : controller,
//         child : Column (
//           crossAxisAlignment : CrossAxisAlignment.start,
//              children: <Widget>[
//                Myheader(
//               image: "assets/images/1.png",
//               textTop : "Berkah nya",
//               textBottom : "Donasi",
//               offset : offset,
//             ),
//           Padding(
//               padding: EdgeInsets.symmetric(horizontal : 20),
//                 child : Text(
//                     "Category",
//                     style : kTitleTextstyle,
//                   )),
//                   SizedBox(height: 20,),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal : 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         SizedBox(width: 25),
//                         SymptomCard(
//                           image: "assets/images/kAkademik.png",
//                           title: "Akademik",
//                           isActive: true,
//                         ),
//                         SizedBox(width: 10,),
//                         SymptomCard(
//                           image: "assets/images/kSosial.png",
//                           title: "Sosial",
//                         ),
//                        SizedBox(width: 30,),
//                       ],
//                     ),

//                   ),

//                 new Padding(padding: EdgeInsets.symmetric(vertical : 20),),
//                 Container(
//                     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                     child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: new Text("Aspirasi dan Keluhan",
//                             style : kTitleTextstyle,))),
//                 StreamBuilder(
//                   stream: Firestore.instance.collection("Aspirasi").snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return SingleChildScrollView(
//                         controller : controller,
//                         scrollDirection: Axis.vertical,
//                         child: ListView.builder(
//                           controller : controller,
//                           scrollDirection: Axis.vertical,
//                           shrinkWrap: true,
//                           itemCount: snapshot.data.documents.length,
//                           itemBuilder: (context, index) {
//                             // Firebase.initializeApp();
//                             DocumentSnapshot documentSnapshot =
//                                 snapshot.data.documents[index];
//                             Map<String, dynamic> task = documentSnapshot.data();
//                             if (documentSnapshot.data()['name'] == "a") {
//                               return FadeAnimation(
//                                   1.8,
//                                   Card(
//                                     color: Color.fromARGB(225, 71, 92, 135),
//                                     child: ListTile(
//                                       leading: new Image.asset(
//                                           "assets/images/wash_hands.png" ,
//                                           fit: BoxFit.cover,
//                                           width: 100.0,
//                                         ),
//                                         title: Text(
//                                             documentSnapshot.data()['name'],
//                                             style:
//                                                 TextStyle(color: Colors.white)),
//                                         subtitle: Text(
//                                             "Like " +
//                                                 documentSnapshot
//                                                     .data()['jumlahLike']
//                                                     .toString(),
//                                             style:
//                                                 TextStyle(color: Colors.white)),
//                                         // leading: CircleAvatar(
//                                         //     child: Image(
//                                         //   image: AssetImage('img/akun.png'),
//                                         // )), 
//                                         isThreeLine: true,
//                                         onTap: () async {
//                                           bool result = await Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) {
//                                               return DetailAspirasi(
//                                                 documentId:
//                                                     documentSnapshot.documentID,
//                                                 name: task['name'],
//                                                 deskripsi: task['deskripsi'],
//                                                 jumlahLike: task['jumlahLike'],
//                                               );
//                                             }),
//                                           );
//                                         }),
//                                   ));
//                             } else {
//                               return FadeAnimation(
//                                   1.8,

//                                   Card(
//                                     color: Color.fromARGB(225, 71, 92, 135),
//                                     child: ListTile(
//                                         title: Text(
//                                             documentSnapshot.data()['name'],
//                                             style:
//                                                 TextStyle(color: Colors.white)),
//                                         subtitle: Text(
//                                             "Like " +
//                                                 documentSnapshot
//                                                     .data()['jumlahLike']
//                                                     .toString(),
//                                             style:
//                                                 TextStyle(color: Colors.white)),
                                        
//                                         isThreeLine: true,
//                                         onTap: () async {
//                                           bool result = await Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) {
//                                               return DetailAspirasi(
//                                                 documentId:
//                                                     documentSnapshot.documentID,
//                                                 name: task['name'],
//                                                 deskripsi: task['deskripsi'],
//                                                 jumlahLike: task['jumlahLike'],
//                                               );
//                                             }),
//                                           );
//                                         }),
//                                   ));
//                             }
//                           },
//                         ),
//                       );
//                     } else {
//                       return Container();
//                     }
//                   },
//                 ),
//                 new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
//               ],            
            
       
//         ),
//       ),
//     );
//   }
// }


// class PreventCard extends StatelessWidget {
//   final String image;
//   final String title;
//   final String text;
//   const PreventCard({
//     Key key,
//     this.image,
//     this.title,
//     this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//       return Padding(
//         padding: const EdgeInsets.only(bottom: 10),
//         child: SizedBox(
//           height: 156,
//           child: Stack(
//             alignment: Alignment.centerLeft,
//             children: <Widget>[
//               Container(
//                 child: ListTile(),
//                 height: 136,
//                 width: double.infinity,
//                 decoration : BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color : Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         offset: Offset(0,8),
//                         blurRadius: 24,
//                         color : kShadowColor,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Image.asset(image),
//                 Positioned(
//                   left: 130,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                     height: 136,
//                     width: MediaQuery.of(context).size.width - 170,
//                     child : Column (
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children : <Widget>[
//                         Text(
//                           title,
//                           style: kTitleTextstyle.copyWith(
//                             fontSize: 16,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             text,
//                             maxLines : 4,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: SvgPicture.asset("assets/icons/forward.svg"),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       );
//     }
//   }


// class SymptomCard extends StatelessWidget{

//   final String image;
//   final String title;
//   final bool isActive;
//   const SymptomCard({
//     Key key,
//     this.image,
//     this.title,
//     this.isActive = false,
//   }) : super(key : key);

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       padding: EdgeInsets.all(10),
//       decoration:  BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.white,
//         boxShadow: [
//           isActive
//           ? BoxShadow(
//             offset: Offset(0,10),
//             blurRadius: 20,
//             color: kActiveShadowColor,
//           )
//           : BoxShadow(
//             offset: Offset(0, 3),
//             blurRadius: 6,
//             color: kShadowColor,
//           ),
//         ],
//       ),
//       child: Column(
//         children: <Widget>[
//           Image.asset(image, height:90),
//           Text(
//             title,
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }