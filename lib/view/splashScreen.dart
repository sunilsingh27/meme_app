import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration (seconds:3),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen(),
      ));


    });
  }





  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[


          Image.network("https://play-lh.googleusercontent.com/1-hPxafOxdYpYZEOKzNIkSP43HXCNftVJVttoo4ucl7rsMASXW3Xr6GlXURCubE1tA=w3840-h2160-rw"),
          SizedBox(height: 20,),
          Center(child: Text("Memes viewers",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),))



        ],
      ),
    );
  }
}
