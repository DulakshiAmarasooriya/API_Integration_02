import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';
import '../model/user_name.dart';
import '../services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  
  @override
  void initState() {
    fetchUsers();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          final color = user.gender == 'male' ? Colors.blue : Colors.green;
          return ListTile(
            title: Text(user.fullname),
            subtitle: Text(user.phone),
            tileColor: color,
          );
        },
      ),
      
    );
  }
  Future<void> fetchUsers()async{
    final response=await UserApi.fetchUsers();
    setState(() {
      users=response;
    });
  }

}
