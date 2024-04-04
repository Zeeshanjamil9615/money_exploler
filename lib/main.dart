// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_exploler/expence.dart';
// import 'package:money_exploler/home.dart';
import 'package:money_exploler/model/person.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:money_exploler/home.dart';
// import 'package:money_exploler/transaction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  Hive.registerAdapter(PersonAdapter());

  // await Hive.initFlutter();
  await Hive.openBox('Money');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Expence(),
    );
  }
}
