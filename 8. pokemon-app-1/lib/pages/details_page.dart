import 'package:flutter/material.dart';
import 'package:routing_app/widgets/my_title.dart';
import 'package:routing_app/widgets/power_badge.dart';

import '../widgets/feature_title_text.dart';
import '../widgets/feature_value_text.dart';

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
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTitle(text: "Pokemon Name", color: Colors.white),
                          Row(
                            children: [
                              PowerBadge(text: "Water"),
                              PowerBadge(text: "Water"),
                            ],
                          ),
                          Container(
                            height: 200.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(34.0),
                    ),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.only(top: 60.0),
                            height: double.infinity,
                            child: Column(
                              children: const [
                                FeatureTitleText(text: "Height"),
                                FeatureTitleText(text: "Weight"),
                                FeatureTitleText(text: "Candy"),
                                FeatureTitleText(text: "Egg")
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.only(top: 60.0),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                FeatureValueText(text: "Height"),
                                FeatureValueText(text: "Height"),
                                FeatureValueText(text: "Height"),
                                FeatureValueText(text: "Height"),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 160.0,
              child: Hero(
                tag: 'pokecard1',
                child: Image.network(
                  "http://www.serebii.net/pokemongo/pokemon/001.png",
                  height: 200.0,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
