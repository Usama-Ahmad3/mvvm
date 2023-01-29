import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    go();
  }

  void go() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool isLogedIn = _prefs.getBool('logedin') ?? false;
    if (isLogedIn) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushNamed(context, RoutesName.home);
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.pushNamed(context, RoutesName.login);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Splash Screen', style: TextStyle(fontSize: 30)),
    ));
  }
}
