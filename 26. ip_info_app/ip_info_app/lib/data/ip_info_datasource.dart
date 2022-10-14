import 'dart:convert';

import 'package:http/http.dart' as http;

class IpData {
  static Future<String> getMyIpAddress() async {
    http.Response res =
        await http.get(Uri.parse("https://api.ipify.org/?format=json"));
    if (res.statusCode == 200) {
      // String rawData = res.body;
      // Map ipMapData = jsonDecode(rawData);
      // String ipAddress = ipMapData["ip"];
      // return ipAddress;

      print(jsonDecode(res.body)["ip"]);
      return jsonDecode(res.body)["ip"];
    }
    return "No Ip Address Found";
  }
}
