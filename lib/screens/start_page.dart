import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/store_cubit/store_cubit.dart';
import 'package:store_app/cubit/store_cubit/store_states.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});
  static String id = 'start';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<StoreCubit>(context).getProducts();
    return BlocBuilder<StoreCubit, StoreStates>(
      builder: (context, state) {
        final storeCubit = BlocProvider.of<StoreCubit>(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 109, 12, 207),
            title: const Text(
              'Store App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color.fromARGB(255, 109, 12, 207),
            unselectedItemColor: Colors.grey,
            currentIndex: storeCubit.currentIndex,
            onTap: (index) => storeCubit.changeBottomNavBar(index),
            items: storeCubit.items,
          ),
          body: storeCubit.getCurrentScreen(),
        );
      },
    );
  }
}
