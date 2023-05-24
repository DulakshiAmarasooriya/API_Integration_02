import 'package:api_integration_02/screen/home.dart';
import 'package:flutter/material.dart';
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:HomeScreen(),
      
    );
  }
}