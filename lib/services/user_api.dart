import 'dart:convert';

import 'package:api_integration_02/model/user_dob.dart';
import 'package:api_integration_02/model/user_location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';
import '../model/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print('Fetch Users Called');
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }
}
