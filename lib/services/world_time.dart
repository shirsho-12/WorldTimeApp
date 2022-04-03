import 'package:http/http.dart';
import 'dart:convert';


class WorldTime {

  String location;  // location name for the UI
  String time;      // time in that location
  String flag;      // url to asset flag location
  String url;       // location for API endpoint

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
      // print(now);

      // Set the time property
      time = now.toString();
    }
    catch (e) {
      print("Caught Error: $e");
      time = "Could not get time data";
    }

  }
}

