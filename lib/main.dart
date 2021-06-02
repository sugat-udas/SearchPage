import 'package:flutter/material.dart';
import 'package:order_app/homePage.dart';
import 'package:order_app/itemList.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
  MultiProvider(providers:[
    ChangeNotifierProvider(
        create: (_)=>SearchHistoryController()
    ),
  ],
  child: MyApp(),
  ));


}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

