import 'package:ecom/core/constaints/shared_preference_keys.dart';
import 'package:ecom/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("HomePage"),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();

                    bool isTokenCleared = await sharedPreferences
                        .remove(SharedPreferenceKeys.TOKEN);
                    if (isTokenCleared) {
                      print("Logged Out");
                    } else {
                      print("Logout failed");
                    }
                    context.goNamed(RouteNames.LOGIN);
                  },
                  child: Text("Logout"))
            ],
          ),
        ),
      ),
    );
  }
}
