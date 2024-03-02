
import 'package:flutter/cupertino.dart';
import 'screens/home_screen.dart';

class EventModel extends ChangeNotifier{
  List<Event> events = [];

  void addEvent (Event newEvent){
    events.add(newEvent);
    notifyListeners();
  }
}


