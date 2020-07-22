import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  String bgImage;
  Color bgColor, contentColor;

  @override
  Widget build(BuildContext context) {

    //receiving data via routes. Ternary is used to add a check if app is loading for first time and there is no data or if there is a data received from previous use
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print("data: " + data.toString());

    //set background
    if (data['isDaytime'] != null){
      bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
      bgColor = data['isDaytime'] ? Colors.blue[200] : Colors.indigo[700];
      contentColor = data['isDaytime'] ? Colors.black : Colors.white;
    }
    else {
      bgImage = '';
      bgColor = Colors.blue[200];
      contentColor = Colors.black;
    }



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
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, "/location");
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag']
                      };
                    });
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
