import 'package:flutter/material.dart';

class Category extends StatefulWidget {
final String category_name,
      imagePath,
      documentId;
  Category({
    // @required this.isEdit,
    @required this.documentId,
    @required this.category_name,
    @required this.imagePath,
  });

 @override
  _CategoryState createState() => _CategoryState();

}

class _CategoryState extends State<Category> {
  final controller = ScrollController();
  double offset = 0;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
    
}