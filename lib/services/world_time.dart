import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name for the UI
  String time; //the time in that location
  String flag; //url to assets flag icon
  String url; //location url for api endpoints
  bool isDaytime; //true or false if daytime or not


  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1,3);
      String offsetMinutes = data['utc_offset'].substring(4,6);

      //Create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));

      //set time property
      time = DateFormat.jm().format(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    }
    catch(e) {
      print("Caught error: $e");
      time = "No Internet";
    }

  }


}