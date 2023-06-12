import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_book/screens/listed.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    acces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 89, 0),
        body: Center(
          child: Container(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "MY COFFE",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 132, 0),
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      //color: Color.fromARGB(255, 131, 95, 95),
                      height: 300,
                      width: double.infinity,
                      child: Lottie.network(
                          "https://assets1.lottiefiles.com/packages/lf20_v4h8ijfx.json"),
                    ),
                    Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 246, 246, 246),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            height: 274,
                            width: double.infinity,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  child: CircleAvatar(
                                    radius: 100,
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 89, 0),
                                    child: Lottie.network(
                                        "https://assets7.lottiefiles.com/packages/lf20_OvY5ZL.json"),
                                  ),
                                )
                              ],
                            )),
                      ],
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

  Future<void> acces() async {
    await Future.delayed(Duration(seconds: 6));

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => listed()));
  }
}
