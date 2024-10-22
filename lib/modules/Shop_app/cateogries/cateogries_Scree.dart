import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial/models/cateogries.dart';
import 'package:tutorial/shared/components/components.dart';
import '../../../layout/cubit/cubit.dart';
import '../../../layout/cubit/states.dart';

class CateogriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder:(context,state)
      {
        var cubit = ShopCubit.get(context);
        return ListView.separated(
            itemBuilder: (context,index)=>buildCategoriesItem(cubit.categoriesModel!.data!.data[index]),
            separatorBuilder: (context,index)=>myDivider(),
            itemCount:  cubit.categoriesModel!.data!.data.length,
        );
      } ,
    );
  }

}

