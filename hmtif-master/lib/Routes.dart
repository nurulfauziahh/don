import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hmtif/Animation/FadeAnimation.dart';
import 'package:hmtif/Views/coba/MyApp.dart';
import 'package:hmtif/donasi/info_screen.dart';
import 'package:hmtif/main.dart';

import 'HalamanDetailAspirasi.dart';
import 'Views/HalamanAspirasi.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.cyan),
    home: Aspirasi(),
  ));
}

class Routes extends StatefulWidget {
  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  final controller = ScrollController();
  double offset = 0;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final List<Widget> _tabItems = [InfoScreen(), Aspirasi(), DetailAspirasi()];
  int _activePage = 0;
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
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: CurvedNavigationBar(
      color: Color.fromARGB(237, 8, 28, 21),
      backgroundColor: Colors.white,
      items: <Widget>[
        Icon(Icons.add, size: 30, color : Colors.white),
        Icon(Icons.list, size: 30, color : Colors.white),
        Icon(Icons.compare_arrows, size: 30, color : Colors.white),
      ],
      onTap: (index) {
           setState(() {
     _activePage = index;
   });
      },
    ),
      body: _tabItems[_activePage],
    );
  }
}
