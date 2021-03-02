import 'package:flutter/material.dart';

class CampCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  const CampCard(
    {Key key, this.image, this.title, this.subtitle})
    : super(key: key);

  @override
  _CampCardState createState() => _CampCardState();
}

class _CampCardState extends State<CampCard> {
  
   String image;
   String title;
   String subtitle;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: Image.network(widget.image,
                // width: 300,
                height: 150,
                fit: BoxFit.fill),
          ),
          ListTile(
            title: Text(widget.title),
            subtitle: Text(widget.subtitle),
          ),
        ],
      ),
    );
  }
}
