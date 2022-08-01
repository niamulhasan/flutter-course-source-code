import 'package:flutter/material.dart';

import 'widgets/pokemon_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.bento_rounded,
                  color: Colors.black,
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Pokedex",
                    style:
                        TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 12,
                  child: Container(
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4 / 3,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                      ),
                      children: [
                        PokemonCard(),
                        PokemonCard(),
                        PokemonCard(),
                        PokemonCard(),
                        PokemonCard(),
                        PokemonCard(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
