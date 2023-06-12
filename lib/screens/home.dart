import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_book/db/dataFunctions.dart';
import 'package:phone_book/model/student_Model.dart';

import 'package:phone_book/screens/listed.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _namecont = TextEditingController();

  final agecont = TextEditingController();

  final _addresscont = TextEditingController();

  final _pincont = TextEditingController();
  final _fullname = TextEditingController();

  final a = SizedBox(
    height: 30,
  );
///////////////////////////imagepicker ////////////////////////////////////////////////////
  File? file; //

  _getimage() async {
    final PickedFile? wantimage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (wantimage != null) {
      setState(() {
        file = File(wantimage.path);
      });
    } //
  } //

//////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    read();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 146, 255, 149),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => listed())),
                icon: Icon(Icons.home))
          ],
          title: Text(
            "PHONEBOOK",
            style: TextStyle(fontSize: 35),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 255, 8),
          shadowColor: Colors.grey,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromARGB(255, 255, 255, 255),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 68, 255, 0),
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                            onPressed: () => _getimage(),
                            icon: Icon(Icons.camera_alt_outlined)),
                      ),
                      Container(
                        child: file != null
                            ? CircleAvatar(
                                radius: 80,
                                child: Container(
                                  width: 160,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(110),
                                    child: Image.file(
                                      file!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ))
                            : CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuIbv-7JSgC23hcGq8qDRBpFzdMBEw8urHdQ&usqp=CAU"),
                                backgroundColor: Color.fromARGB(255, 0, 255, 8),
                                radius: 80,
                              ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 26, 255, 0),
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                            onPressed: () => _getimage(),
                            icon: Icon(Icons.photo_sharp)),
                      ),
                    ],
                  ),
                  a,
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _namecont,
                          decoration: InputDecoration(
                              hintText: "Add your name",
                              prefix: Icon(Icons.person),
                              labelText: "Name",
                              border: OutlineInputBorder()),
                        ),
                        a,
                        TextFormField(
                          controller: agecont,
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          decoration: InputDecoration(
                              hintText: "Add your age",
                              prefix: Icon(Icons.numbers),
                              labelText: "Age",
                              border: OutlineInputBorder()),
                        ),
                        a,
                        TextFormField(
                          controller: _addresscont,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                              hintText: "Add your adress",
                              prefix: Icon(Icons.location_city_outlined),
                              labelText: "Address",
                              border: OutlineInputBorder()),
                        ),
                        a,
                        TextFormField(
                          controller: _pincont,
                          maxLength: 6,
                          keyboardType: TextInputType.number,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              enabled: true,
                              hintText: "Add your pincode",
                              prefix: Icon(Icons.pin_drop_rounded),
                              labelText: "pincode",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 10,
                                      color: Color.fromARGB(255, 0, 255, 8)))),
                        ),
                        TextFormField(
                          controller: _fullname,
                          maxLength: 6,
                          keyboardType: TextInputType.number,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              enabled: true,
                              hintText: "Add your fullname",
                              prefix: Icon(Icons.pin_drop_rounded),
                              labelText: "fullname",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 10,
                                      color: Color.fromARGB(255, 0, 255, 8)))),
                        ),
                        a,
                        Container(
                          width: 400,
                          height: 50,
                          /////////////////////////////elevated button////////////////////////////////////
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (file != null) {
                                acess(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        dismissDirection: DismissDirection.down,
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 251, 0),
                                        content: Text(
                                          "Please Fill Your Details",
                                          style: TextStyle(color: Colors.black),
                                        )));
                              }
                            },
                            icon: Icon(Icons.flag),
                            label: Text(
                              "Confirm",
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 0, 255, 8)),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*Future<void> Access(BuildContext context) async {
    var _cont1 = _namecont.text.trim();

    final cont2 = agecont.text.trim();
    var _cont3 = _addresscont.text.trim();
    final _cont4 = _pincont.text.trim();
 

    final st = studentgt(
      id: 0,
      name: _cont1,
      age: cont2,
      address: _cont3,
      pincode: _cont4, Photo: _file.,
    );
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => listed()));

    add(studentgt, st);
  }*/

  Future<void> acess(BuildContext context) async {
    var _cont1 = _namecont.text.trim();

    final cont2 = agecont.text.trim();
    var _cont3 = _addresscont.text.trim();
    final _cont4 = _pincont.text.trim();

    final _cont5 = _fullname.text.trim();

    if (_cont1.isEmpty ||
        cont2.isEmpty ||
        _cont3.isEmpty ||
        _cont4.isEmpty ||
        _cont5.isEmpty ||
        file!.path.isEmpty) {
      return;
    } else {
      final st = studentgt(
        name: _cont1,
        age: cont2,
        address: _cont3,
        pincode: _cont4,
        Photo: file!.path,
        id: 1,
        /*  fullname: _cont5,*/
      );
      add(studentgt, st);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => listed()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 0, 255, 8),
          content: Title(color: Colors.black, child: Text("ADDED"))));
    }
  }
}
