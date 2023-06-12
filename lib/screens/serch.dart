import 'dart:io';

import 'package:flutter/material.dart';
import 'package:phone_book/db/dataFunctions.dart';
import 'package:phone_book/model/student_Model.dart';
import 'package:phone_book/screens/details.dart';

/////////////////////////////////////////////serch  delfate ////////////////////////////////////////////////////////////////////////////////////////////
// ignore: camel_case_types
class serch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(onPressed: () => query = "", icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentlist,
        builder:
            (BuildContext ctx, List<studentgt> studentList, Widget? child) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final data = studentList[index];
              if (data.name.toLowerCase().contains(
                    query.toLowerCase(),
                  )) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => Details(
                                  named: data.name,
                                  aged: data.age,
                                  addressed: data.address,
                                  pincoded: data.pincode,
                                  potos: data.Photo, /* fullnamemy: '',*/
                                  /* fullnamemy: data.fullname,*/
                                )));
                      },
                      title: Text(data.name),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(File(data.Photo)),
                      ),
                    ),
                    const Divider()
                  ],
                );
              } else {
                return Container();
              }
            },
            itemCount: studentList.length,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container(
      child: ValueListenableBuilder(
          valueListenable: studentlist,
          builder: (BuildContext context, List<studentgt> studentlist,
              Widget? child) {
            return ListView.builder(
                itemCount: studentlist.length,
                itemBuilder: (BuildContext context, index) {
                  final data = studentlist[index];

                  if (data.name
                      .toLowerCase()
                      .contains(query.toLowerCase().trim())) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Details(
                                        named: data.name,
                                        aged: data.age,
                                        addressed: data.address,
                                        pincoded: data.pincode,
                                        potos: data.Photo,
                                        /*  fullnamemy: data.fullname,*/
                                      ))),
                          title: Text(data.name),
                          subtitle: Text(data.age),
                          leading: CircleAvatar(
                            backgroundImage: FileImage(File(data.Photo)),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                });
          }));
}

/* if (query.isEmpty && studentlist.contains(query)) {
                  return Card(
                    child: Container(
                      child: Text(query),
                    ),
                  );
                } else if (query == "") {
                  Text("");
                } else {
                  ListTile(
                    title: Text(query),
                    subtitle: Text(query),
                  );
                }*/

/*  @override
  Widget buildSuggestions(BuildContext context) {
    return Card(
      child: ValueListenableBuilder(
          valueListenable: studentlist,
          builder: (BuildContext context, List<studentgt> studentlist,
              Widget? child) {
            final mylist = query.isEmpty
                ? studentlist
                : studentlist
                    .where((element) => element.toString().startsWith(query))
                    .toList();
            return Container(
                child: ListView.builder(
                    itemCount: mylist.length,
                    itemBuilder: (context, index) {
                      // ignore: unused_local_variable
                      final suggestion = studentlist[index];

                      return ListTile(
                        onTap: () {
                          query = suggestion.name;
                        },
                        title: Text(suggestion.name),
                        subtitle: Text(suggestion.age),
                      );
                    }));
          }),
    );
  }
}

void sample() {
  Container(
      child: ValueListenableBuilder(
          valueListenable: studentlist,
          builder: (BuildContext context, List<studentgt> studentlist,
              Widget? child) {
            return Container();
          }));
}*/
/*ListView.builder(
              itemCount: studentlist.length,
              itemBuilder: (context, index) =>
                  (query == null && query.contains(query)
                      ? Card(
                          child: Container(
                              height: 200,
                              width: double.infinity,
                              color: Colors.grey,
                              child: Card(
                                child: Container(
                                  color: Colors.red,
                                  child: ListTile(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                                key: null,
                                                named: studentlist[index].name,
                                                aged: studentlist[index].age,
                                                pincoded:
                                                    studentlist[index].pincode,
                                                addressed: studentlist[index]
                                                    .address))),
                                    title: Text(studentlist[index].name),
                                  ),
                                ),
                              )))
                      : (query == "")
                          ? Text("")
                          : ListTile(
                              title: Text(studentlist[index].name),
                            )));*/
