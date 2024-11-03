import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial/layout/cubit/cubit.dart';
import 'package:tutorial/layout/cubit/states.dart';
import 'package:tutorial/shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener:(context,state){} ,
      builder:(context,state)
      {
        var cubit = ShopCubit.get(context);

        return ConditionalBuilder(
            condition: state is! ShopLoadingGetFavoritesStates,
            builder:(context)=> ListView.separated(
              itemBuilder: (context,index)=>buildListProduct(cubit.favoritesModel!.data!.data![index].product!,context),
              separatorBuilder: (context,index)=>myDivider(),
              itemCount:cubit.favoritesModel!.data!.data!.length ,
            ),
            fallback: (context)=>const Center(child: CircularProgressIndicator())
        );
      } ,

    );
  }

}






