import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/store_cubit/store_cubit.dart';
import 'package:store_app/cubit/store_cubit/store_states.dart';
import 'package:store_app/widgets/custom_fav.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(
      builder: (context, state) {
        final storeCubit = BlocProvider.of<StoreCubit>(context);
        final favoriteProducts = storeCubit.favoriteProducts;
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
          child: GridView.builder(
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              childAspectRatio: 3,
            ),
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              return Customfav(product: favoriteProducts[index]);
            },
          ),
        );
      },
    );
  }
}
