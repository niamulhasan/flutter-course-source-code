import 'package:flutter/material.dart';
import 'package:ip_info_app/data/ip_data.dart';
import 'package:ip_info_app/widgets/my_button.dart';

import 'widgets/info_text.dart';
import 'widgets/info_title_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController ipInputFieldController = TextEditingController();

  String ipAddress = "No IP";
  String city = "None";
  String region = "None";
  String country = "None";
  String latLong = "None";
  String operator = "None";
  String postalCode = "None";
  String timeZone = "None";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/bg_highlight.png")),
            color: Color(0xff0F0817),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 120.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  controller: ipInputFieldController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                      fillColor: Color(0xff1E133E),
                      filled: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      text: "My Ip",
                      icon: Image.asset(
                        "assets/my_ip.png",
                        width: 30.0,
                      ),
                      onPressed: () async {
                        String ipFormDataSource = await IpData.getMyIpAddress();
                        ipInputFieldController.text = ipFormDataSource;
                        setState(() {
                          ipAddress = ipFormDataSource;
                        });
                      },
                    ),
                    SizedBox(width: 10.0),
                    MyButton(
                      text: "Get Info",
                      icon: Image.asset(
                        "assets/get_info.png",
                        width: 30.0,
                      ),
                      onPressed: () async {
                        Map ipInfo = await IpData.getIpInformation(
                            ipInputFieldController.text);
                        setState(() {
                          city = ipInfo["city"];
                          region = ipInfo["region"];
                          country = ipInfo["country"];
                          latLong = ipInfo["loc"];
                          operator = ipInfo["org"];
                          postalCode = ipInfo["postal"];
                          timeZone = ipInfo["timezone"];
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  children: [
                    Text(
                      "Information about the IP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "${ipAddress}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InfoTitleText(text: "City"),
                        InfoTitleText(text: "Region"),
                        InfoTitleText(text: "Country"),
                        InfoTitleText(text: "Lat & Long"),
                        InfoTitleText(text: "Operator"),
                        InfoTitleText(text: "Postal Code"),
                        InfoTitleText(text: "Time Zone"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoText(text: "$city"),
                          InfoText(text: "$region"),
                          InfoText(text: "$country"),
                          InfoText(text: "$latLong"),
                          InfoText(
                              text:
                                  "${operator.length > 20 ? operator.substring(0, 20) : operator}"),
                          InfoText(text: "$postalCode"),
                          InfoText(text: "$timeZone"),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
