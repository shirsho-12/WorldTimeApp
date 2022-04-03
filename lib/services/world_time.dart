import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location;  // location name for the UI
  String time;      // time in that location
  String flag;      // url to asset flag location
  String url;       // location for API endpoint
  late bool isDayTime;

  WorldTime({required this.location,required this.flag, required this.url,
            this.time=""});

  Future<void> getTime() async {
    // Making the Request
    try {
      String fullUrl = "http://worldtimeapi.org/api/timezone/$url";
      Response response = await get(Uri.parse(fullUrl));
      Map data = jsonDecode(response.body);
      // print(data);

      // Get properties from data
      String dateTime = data["datetime"];
      String offset = data["utc_offset"].substring(0, 3);

      DateTime now = DateTime.parse(dateTime);
      // print(now);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = 6 < now.hour && now.hour < 20 ? true : false;

      // Set the time property
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print("Caught Error: $e");
      time = "Could not get time data";
    }

  }
}

