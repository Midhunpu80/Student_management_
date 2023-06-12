import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:phone_book/db/dataFunctions.dart';
import 'package:phone_book/screens/home.dart';
import 'package:phone_book/screens/listed.dart';
import 'package:phone_book/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(studentgtAdapter());
  await Hive.openBox<studentgt>("database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
         
        ),
        home: Scaffold(
          body: Splash(),
        ));
  }
}
