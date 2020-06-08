import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue[200] : Colors.indigo[700];
    Color contentColor = data['isDaytime'] ? Colors.black : Colors.white;


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, "/location");
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: contentColor,
                  ),
                  label: Text(
                    "Edit Location",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: contentColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: contentColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 66.0,
                    color: contentColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
