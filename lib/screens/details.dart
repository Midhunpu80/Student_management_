import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:phone_book/screens/listed.dart';

class Details extends StatelessWidget {
  final named;
  final aged;
  final addressed;
  final pincoded;
  dynamic potos;

  /* String fullnamemy;*/

  Details(
      {/*required this.fullnamemy,*/
      required this.named,
      required this.aged,
      required this.addressed,
      required this.pincoded,
      required this.potos}) {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("DETAILS"),
          backgroundColor: Color.fromARGB(255, 0, 255, 8),
        ),
        body: Card(
          child: Container(
            color: Color.fromARGB(255, 216, 239, 90),
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: CircleAvatar(
                            radius: 90,
                            backgroundImage: FileImage(File(potos))),
                      ),
                    ),
                    SizedBox(
                      height: 65,
                    ),
                    Card(
                      child: Container(
                        height: 500,
                        width: double.infinity,
                        color: Color.fromARGB(255, 216, 239, 90),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              named,
                              style: TextStyle(
                                  fontSize: 30, fontStyle: FontStyle.italic),
                            ),
                            Text(
                              aged,
                              style: TextStyle(
                                  fontSize: 30, fontStyle: FontStyle.italic),
                            ),
                            Text(
                              addressed,
                              style: TextStyle(
                                  fontSize: 30, fontStyle: FontStyle.italic),
                            ),
                            Text(
                              pincoded,
                              style: TextStyle(
                                  fontSize: 30, fontStyle: FontStyle.italic),
                            ),
                            /*   Text(
                              fullnamemy,
                              style: TextStyle(
                                  fontSize: 30, fontStyle: FontStyle.italic),
                            )*/
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
