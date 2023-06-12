import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_book/db/dataFunctions.dart';
import 'package:phone_book/model/student_Model.dart';
import 'package:phone_book/screens/details.dart';
import 'package:phone_book/screens/edit.dart';
import 'package:phone_book/screens/home.dart';
import 'package:phone_book/screens/serch.dart';

class listed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    read();
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            backgroundColor: Color.fromARGB(255, 0, 255, 8),
            onPressed: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Home(),
            )),
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () =>
                      showSearch(context: context, delegate: serch()),
                  icon: const Icon(Icons.search_rounded))
            ],
            centerTitle: true,
            title: const Text(
              "List of Students",
              style: TextStyle(fontSize: 25),
            ),
            backgroundColor: const Color.fromARGB(255, 0, 255, 8),
          ),
          body: Container(
              child: ValueListenableBuilder(
                  valueListenable: studentlist,
                  builder: (BuildContext context, List<studentgt> studentlist,
                      Widget? child) {
                    return ListView.builder(
                        itemCount: studentlist.length,
                        itemBuilder: (context, index) {
                          final studentbox = studentlist[index];
                          return Card(
                            child: Container(
                              color: const Color.fromARGB(255, 240, 255, 104),
                              height: 80,
                              child: ListTile(
                                onTap: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                        builder: (context) => Details(
                                              named: studentbox.name,
                                              aged: studentbox.age,
                                              pincoded: studentbox.pincode,
                                              addressed: studentbox.address,
                                              potos: studentbox.Photo,
                                              /*   fullnamemy: studentbox.fullname,*/
                                            ))),
                                title: Text(studentbox.name),
                                subtitle: Text(studentbox.name),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(File(studentbox.Photo)),
                                ),
                                trailing: FittedBox(
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    edit_student(
                                                        stdage: studentbox.age,
                                                        index: index,
                                                        stdname:
                                                            studentbox.name,
                                                        stdpincode:
                                                            studentbox.pincode,
                                                        stdaddress:
                                                            studentbox.address,
                                                        stdphoto:
                                                            studentbox.Photo))),
                                        icon: const Icon(Icons.edit),
                                        color: Colors.green,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          if (studentbox.id != null) {
                                            delete(studentbox.id);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 255, 17, 0),
                                                    content: Title(
                                                        color: Color.fromARGB(
                                                            255, 255, 17, 0),
                                                        child:
                                                            Text("Deleted"))));
                                          }
                                        },
                                        icon: const Icon(Icons.delete),
                                        color: const Color.fromARGB(
                                            255, 255, 0, 0),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }))),
    );
  }
}
