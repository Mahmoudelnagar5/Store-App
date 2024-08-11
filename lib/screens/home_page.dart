import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_app/cubit/store_cubit/store_cubit.dart';
import 'package:store_app/cubit/store_cubit/store_states.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: BlocBuilder<StoreCubit, StoreStates>(
          builder: (context, state) {
            return GridView.builder(
              clipBehavior: Clip.none,
              itemCount: BlocProvider.of<StoreCubit>(context).products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 90,
              ),
              itemBuilder: (context, index) {
                return CustomCard(
                  product: BlocProvider.of<StoreCubit>(context).products[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
