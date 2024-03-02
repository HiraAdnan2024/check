
import 'package:check/event_model.dart';
import 'package:check/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => EventModel()),
        ],
        child: MyApp() ,
      ),
     );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'OccasionOrbit',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SplashScreen() ,
    );
  }
}