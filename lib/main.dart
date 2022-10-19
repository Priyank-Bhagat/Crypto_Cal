import 'package:crypto_calc/Repository/asset_repo.dart';
import 'package:crypto_calc/Screens/home_page.dart';
import 'package:crypto_calc/bloc/asset/asset_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() => runApp(
      const MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssetBloc(assetRepo: AssetIMPL()),
      child:  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: CryptoCalc(),
      
      ),
    );
  }
}
