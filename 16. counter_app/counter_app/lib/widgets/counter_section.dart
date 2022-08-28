import 'package:flutter/material.dart';

class CounterSection extends StatefulWidget {
  const CounterSection({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterSection> createState() => _CounterSectionState();
}

class _CounterSectionState extends State<CounterSection> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          counter.toString(),
          style: TextStyle(fontSize: 40.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter = counter + 1;
                  });
                },
                child: Text("Increase")),
            SizedBox(
              width: 60.0,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter = counter - 1;
                  });
                },
                child: Text("Decrease"))
          ],
        )
      ],
    );
  }
}
