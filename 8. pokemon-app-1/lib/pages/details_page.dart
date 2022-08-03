import 'package:flutter/material.dart';
import 'package:routing_app/widgets/power_badge.dart';

import '../widgets/my_title.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4ad0b0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Container(child: MyHeader()),
            // Container(
            //   color: Colors.white,
            //   width: double.infinity,
            //   height: 500.0,
            // )
          ],
        ),
      ),
    );
  }
}

class MyHeader extends StatelessWidget {
  const MyHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTitle(text: "Bulbasaur", color: Colors.white),
        Row(
          children: [PowerBadge(text: "Water"), PowerBadge(text: "Fire")],
        ),
      ],
    );
  }
}
