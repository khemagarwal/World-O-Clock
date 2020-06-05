import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {
    //simulating a network request to get username from DB
    String username = await Future.delayed(Duration(seconds: 3), (){
      return "Khedu";
    });

    //Simulate network request to get bio of the username from db
    String bio = await Future.delayed(Duration(seconds: 2), (){
      return "Software Developer, Video Editor & Fun Enhancer";
    });

    print ("$username -> $bio");
    print("Data received.");
  }

  @override
  void initState() {
    super.initState();
//    print("initState function ran");
    getData();
    print("Hey there");
  }

  @override
  Widget build(BuildContext context) {
//    print("build function ran");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
