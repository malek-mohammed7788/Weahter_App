import 'package:flutter/material.dart';
import 'package:weahter_app/Screen/Home_Page.dart';
import 'package:provider/provider.dart';
import 'package:weahter_app/Provider/weather_provider.dart';

void main() => (runApp(ChangeNotifierProvider(
      create: ((context) {
        return weatherProvider();
      }),
      child:const MyApp(),
    )));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
  }
}
