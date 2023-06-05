import 'package:api_integration_02/model/user_dob.dart';
import 'package:api_integration_02/model/user_name.dart';
import 'package:flutter/material.dart';

import 'user_location.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;


  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
     required this.dob,
     required this.location,
  });

  String get fullname{
    return '${name.title}' '${name.first}' '${name.last}';
  }
}

