// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
part 'dataFunctions.g.dart';

@HiveType(typeId: 1)
class studentgt {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  String name;

  @HiveField(2)
  String age;
  @HiveField(3)
  String address;
  @HiveField(4)
  String pincode;
  @HiveField(5)
  dynamic Photo;
/*
  @HiveField(6)
  dynamic fullname;*/

  studentgt({
    required this.id,
    required this.name,
    required this.age,
    required this.address,
    required this.pincode,
    required this.Photo,
/*  required fullname,*/
  });
}
