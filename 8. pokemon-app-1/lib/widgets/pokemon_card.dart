import 'package:flutter/material.dart';

import 'power_badge.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bulbasaur",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            PowerBadge(text: "Fire"),
            PowerBadge(text: "Water"),
          ],
        ),
      ),
    );
  }
}
