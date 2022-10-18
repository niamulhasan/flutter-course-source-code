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

  static Future<Map> getIpInformation(String ipAddress) async {
    http.Response res =
        await http.get(Uri.parse("https://ipinfo.io/$ipAddress/geo"));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    return {
      "ip": "Failed to fetch ip",
      "city": "Failed",
      "region": "Failed",
      "country": "Failed",
      "loc": "Failed",
      "org": "Failed",
      "postal": "Failed",
      "timezone": "Failed",
    };
  }
}
