// ignore_for_file: unused_element

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_book/db/dataFunctions.dart';
import 'package:phone_book/model/student_Model.dart';

import 'listed.dart';

class edit_student extends StatefulWidget {
  var stdname;
  var stdage;
  var stdaddress;
  var stdpincode;
  dynamic stdphoto;
  dynamic fullnamed;
  int index;

  edit_student(
      {required this.index,
      required this.stdname,
      this.stdage,
      required this.stdpincode,
      required this.stdaddress,
      required this.stdphoto}) {}

  @override
  State<edit_student> createState() => _edit_studentState();
}

class _edit_studentState extends State<edit_student> {
  File? _file; //

  getimage() async {
    final PickedFile? _wantimage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (_wantimage != null) {
      setState(() {
        _file = File(_wantimage.path);
      });
    } //
  } //

  final a = SizedBox(
    height: 30,
  );

  /* edit_student(var _stdname, var _stdage, var _stdaddress, var _stdpincode,
      dynamic _stdphoto) {
    this._stdname;
    this._stdaddress;
    this._stdage;
    this._stdphoto;
    this._stdpincode;
  }*/

  TextEditingController studentname = TextEditingController();

  TextEditingController _studentage = TextEditingController();
  TextEditingController _studentaddress = TextEditingController();

  TextEditingController _studentpincode = TextEditingController();

  TextEditingController _studentfullname = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentname = TextEditingController(text: widget.stdname);
    _studentage = TextEditingController(text: widget.stdage);
    _studentaddress = TextEditingController(text: widget.stdaddress);
    _studentpincode = TextEditingController(text: widget.stdpincode);
    _studentfullname = TextEditingController(text: widget.fullnamed);
  }

  @override
  Widget build(BuildContext context) {
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
                            onPressed: () => getimage(),
                            icon: Icon(Icons.camera_alt_outlined)),
                      ),
                      Container(
                        child: _file != null
                            ? CircleAvatar(
                                radius: 80,
                                child: Container(
                                  width: 160,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(110),
                                    child: Image.file(
                                      _file!,
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
                            onPressed: () => getimage(),
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
                          controller: studentname,
                          decoration: InputDecoration(
                              hintText: "Add your name",
                              prefix: Icon(Icons.person),
                              labelText: "Name",
                              border: OutlineInputBorder()),
                        ),
                        a,
                        TextFormField(
                          controller: _studentage,
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
                          controller: _studentaddress,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                              hintText: "Add your adress",
                              prefix: Icon(Icons.location_city_outlined),
                              labelText: "Address",
                              border: OutlineInputBorder()),
                        ),
                        a,
                        TextFormField(
                          controller: _studentpincode,
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
                        /*  TextFormField(
                          controller: _studentfullname,
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
                        ),*/
                        a,
                        Container(
                          width: 400,
                          height: 50,
                          /////////////////////////////elevated button////////////////////////////////////
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (_file != null) {
                                edtingall();
                              } else {}
                            },
                            icon: Icon(Icons.flag),
                            label: Text(
                              "UPDATE",
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

  Future<void> edtingall() async {
    final st1 = studentname.text.trim();
    final st2 = _studentage.text.trim();
    final st3 = _studentaddress.text.trim();
    final st4 = _studentpincode.text.trim();
    final st5 = _studentfullname.text.trim();

    if (st1.isEmpty ||
        st2.isEmpty ||
        st3.isEmpty ||
        st4.isEmpty ||
        st5.isEmpty ||
        _file!.path.isEmpty) {
      return;
    } else {
      final updation = studentgt(
        name: widget.stdname,
        age: widget.stdage,
        address: widget.stdaddress,
        pincode: widget.stdpincode,
        Photo: _file!.path,
        id: 0,
      );
      /*  fullname: widget.fullnamed);*/

      update(widget.index, updation);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => listed()));

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 0, 255, 229),
          content: Text(
            "UPDATE",
          )));
    }
  }
}
