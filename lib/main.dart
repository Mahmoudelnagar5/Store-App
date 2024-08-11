import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/store_cubit/store_cubit.dart';
import 'package:store_app/screens/category_page.dart';
import 'package:store_app/screens/electornics.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/jewelery_page.dart';
import 'package:store_app/screens/mens_clothes.dart';
import 'package:store_app/screens/start_page.dart';
import 'package:store_app/screens/women_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (BuildContext context) => StoreCubit(),
      child: const StoreApp(),
    ),
  );
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        StartPage.id: (context) => const StartPage(),
        HomePage.id: (context) => const HomePage(),
        WomenPage.id: (context) => const WomenPage(),
        MenPage.id: (context) => const MenPage(),
        JeweleryPage.id: (context) => const JeweleryPage(),
        ElectronicsPage.id: (context) => const ElectronicsPage(),
        CategoryPage.id: (context) => const CategoryPage(),
      },
      initialRoute: StartPage.id,
    );
  }
}
