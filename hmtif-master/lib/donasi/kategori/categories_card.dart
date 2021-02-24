import 'package:flutter/material.dart';


class CategoriesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 110,
      // padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Image.asset("assets/images/kSosial.png", height:90,  fit: BoxFit.fill),
            Text(
              "Sosial",
              style: TextStyle(fontWeight: FontWeight.bold)
              ),
          ],
        ),
        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
  elevation: 5,
  margin: EdgeInsets.all(2),
      ),
    );
  }
  
}
