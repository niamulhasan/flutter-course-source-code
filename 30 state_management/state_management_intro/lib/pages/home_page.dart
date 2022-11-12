import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_intro/providers/counter_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterProvider>(
      create: (context) => CounterProvider(),
      child: HomePageUI(title: title),
    );
  }
}

class HomePageUI extends StatelessWidget {
  const HomePageUI({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterProvider>(
              builder: (_, value, __) => Text(
                '${value.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<CounterProvider>(context, listen: false).increase(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
