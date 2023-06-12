import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:phone_book/db/dataFunctions.dart';
// ignore: duplicate_import
import 'package:phone_book/db/dataFunctions.dart';
import 'package:phone_book/db/dataFunctions.dart';

ValueNotifier<List<studentgt>> studentlist = ValueNotifier([]);

// ignore: avoid_types_as_parameter_names

///////////////addd  value in db and add the list /////////////////////////////////////
Future<void> add(studentModel, value) async {
  final studentDb = await Hive.openBox<studentgt>("database");

  final _iddata = await studentDb.add(value);
  // ignore: unused_local_variable
  final id = _iddata;
  read();

  /*studentlist.value.add(value);
  studentlist.notifyListeners();*/
}

////////////////////////////////show the value sin display /////////////////////
Future<void> read() async {
  final studentDb = await Hive.openBox<studentgt>("database");

  studentlist.value.clear();

  studentlist.value.addAll(studentDb.values);

  studentlist.notifyListeners();
}

/////////////////////////////////delete the  list //////////////////////////////
Future<void> delete(int index) async {
  final studentDb = await Hive.openBox<studentgt>("database");
  await studentDb.deleteAt(index);

  read();
}

//////////////////////////////////update the list //////////////////////////////
Future<void> update(int id, studentgt value) async {
  final studentDb = await Hive.openBox<studentgt>("database");
  await studentDb.putAt(id, value);
  read();
}
////////////////////////////////////////////////////////////////////////////////