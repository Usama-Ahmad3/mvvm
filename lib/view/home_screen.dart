import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              width: 30,
            ),
            InkWell(
                onTap: () async {
                  SharedPreferences _prefs =
                      await SharedPreferences.getInstance();
                  _prefs.setBool('logedin', false) as bool;
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Icon(Icons.logout)),
          ],
        ),
        body: Column(
          children: const [],
        ));
  }
}
