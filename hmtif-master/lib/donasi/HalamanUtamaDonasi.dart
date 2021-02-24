import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hmtif/donasi/constant.dart';
import 'package:hmtif/donasi/info_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {

      '/donasi': (context) => Donasi(),
      '/donasi2': (context) => InfoScreen(),
    },
    theme: ThemeData(

      scaffoldBackgroundColor: kBackgroundColor,
      textTheme: TextTheme(
      body1: TextStyle(color: kBodyTextColor))),
    home: Donasi(),
  ));
}

class Donasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
            padding: EdgeInsets.only(left: 40, top: 50, right: 20),
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF3383CD),
                  Color(0xFF11249F),
                ],
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/virus.png"),
                ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                child:
                SvgPicture.asset("assets/icons/menu.svg"),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/icons/Drcorona.svg",
                        width: 230,
                        fit:  BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                        ),
                        Positioned(
                          top: 20,
                          left : 150,
                          child: Text(
                            "Donasi itu \nmembawa Berkah.",
                            style: kHeadingTextStyle.copyWith(
                              color: Colors.white, 
                              ),
                          ),
                        ),
                        Container(), 
                      ],
                    ),
                )
              ]
            ),
          ),
          ),
      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            child: Text('Donasi'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/donasi2');
                            },
                            color: Colors.white,
                          ),
                        ],
                      ),
         
            
          
        ],
      ),
        );
  }
}


class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
      var path = Path();
      path.lineTo(0, size.height - 80);
      path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
      path.lineTo(size.width, 0);
      path.close();
      return path;
    }
  
    @override
    bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    
    return false;
  }

}