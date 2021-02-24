import 'package:flutter/material.dart';
//data
import 'package:hmtif/donasi/kategori/category_data.dart';
import 'package:hmtif/donasi/kategori/categories_card.dart';
//model
import 'package:hmtif/donasi/kategori/category_model.dart';

class CampaignCategories extends StatelessWidget{

final List<Category> _categories = categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (BuildContext context, int index){
          return CategoriesCard();
        },
      ),
    );
  }
  
}