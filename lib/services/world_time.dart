import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name for the UI
  String time; //the time in that location
  String flag; //url to assets flag icon
  String url; //location url for api endpoints

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1,3);
      String offsetMinutes = data['utc_offset'].substring(4,6);
      //print("datetime: " + datetime);
      //print("offsetHours: " + offsetHours);
      //print("offsetMinutes: " + offsetMinutes);

      //Create DateTime object
      DateTime now = DateTime.parse(datetime);
      //print("now: " + now.toString());
      now = now.add(Duration(hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));

      //set time property
      time = DateFormat.jm().format(now);

      //print(now);
    }
    catch(e) {
      print("Caught error: $e");
      time = "No Internet";
    }

  }


}