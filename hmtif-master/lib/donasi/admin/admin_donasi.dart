import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hmtif/Animation/FadeAnimation.dart';
import 'package:hmtif/HalamanDetailAspirasi.dart';
import 'package:hmtif/donasi/admin/HalamanEditDonasi.dart';
import 'package:hmtif/donasi/admin/HalamanTambahDonasi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.cyan),
    home: AdminDonasi(),
  ));
}

class AdminDonasi extends StatelessWidget {
  String name;
  // navigateToDetail(BuildContext context, DocumentSnapshot post) async {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => EditAspirasi(
  //                 MyStudent: post,
  //               )));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new TambahDonasi()));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: new BottomAppBar(
          elevation: 20,
          color: Colors.purple,
          child: ButtonBar(
            children: <Widget>[],
          ),
        ),
        body: SingleChildScrollView(
          child: new Container(
            child: new Column(
              children: <Widget>[
                StreamBuilder(
                  stream:
                      Firestore.instance.collection("Donasi").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            
                            DocumentSnapshot documentSnapshot =
                                snapshot.data.documents[index];
                            Map<String, dynamic> task = documentSnapshot.data();

                            return FadeAnimation(
                                1.8,
                                Card(
                                  child: ListTile(
                                    title:
                                        Text(documentSnapshot.data()['namaDonasi']),
                                    subtitle: Text("dana yang dibutuhkan " +
                                        documentSnapshot.data()['danaDonasi'].toString()),
                                    leading: CircleAvatar(
                                        child: Image(
                                      image: AssetImage('img/akun.png'),
                                    )),
                                    trailing: Wrap(
                                      spacing: 12,
                                      children: <Widget>[
                                        new IconButton(
                                            icon: new Icon(Icons.edit),
                                            onPressed: () async {
                                              
                                              bool result = await Navigator.push(context, MaterialPageRoute(builder: (context){
                                                return EditDonasi(
                                                  documentId: documentSnapshot.documentID,
                                                  namaDonasi: task['namaDonasi'],
                                                  deskripsi: task['deskripsi'],
                                                  shortDeskripsi: task['shortDeskripsi'],
                                                  danaDonasi: task['danaDonasi'],
                                                  gambarDonasi: task['gambarDonasi'],
                                                );
                                              }
                                              ),
                                              );
                                            }
                                            ),
                                        new IconButton(
                                            icon: new Icon(Icons.delete),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Yakin Mau Hapus?'),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text('No'),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                      FlatButton(
                                                        child: Text('Delete'),
                                                        onPressed: () {
                                                          documentSnapshot
                                                              .reference
                                                              .delete();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            })
                                      ],
                                    ),
                                    isThreeLine: true,
                                    // onTap: () => navigateToDetail(context,
                                    //     snapshot.data.documents[index]),
                                  ),
                                ));
                          },
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
