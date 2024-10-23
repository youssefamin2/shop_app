import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder:(context,index)=>buildListProduct() ,
        separatorBuilder:(context,index)=> myDivider(),
        itemCount: 10);
  }

  Widget buildListProduct()=>Container(
    height: 120.0,
    child: Row(
      children:
      [
        Image(
          image: NetworkImage('https://student.valuxapps.com/storage/uploads/categories/16893929290QVM1.modern-devices-isometric-icons-collection-with-sixteen-isolated-images-computers-periphereals-variou.jpeg'),
          width: 120.0,
          height: 20.0,
        ),

      ],
    ),
  );
}
