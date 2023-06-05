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
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      final date = e['dob']['date'];
      final dob = UserDob(
        date: DateTime.parse(date),
        age: e['dob']['age'],
      );

      final coordinates = LocationCoordinates(
          latitude: e['location']['coordinates']['latitude'],
          longtitude: e['location']['coordinates']['longtitude']);

      final street = LocationStreet(
          number: e['location']['street']['number'],
          name: e['location']['street']['name']);

      final timezone = LocationTimeZoneCoordinate(
          offset: e['location']['timezone']['offset'],
          description: e['location']['timezone']['description']);

      final location = UserLocation(
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString(),
        street: e['location']['street'],
        coordinates: e['location']['coordinates'],
        timezone: e['location']['timezone'],
      );

      return User(
        gender: e['gender'],
        email: e['emai'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: name,
        dob: dob,
        location: location,
      );
    }).toList();
    return users;
  }
}
