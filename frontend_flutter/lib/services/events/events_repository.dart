import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:frontend_flutter/model/events/events_model.dart';

class EventsRepository {
  Future<List<Events>> getEvents() async {
    final loadJsonFile = await rootBundle.loadString("Assets/Json/events.json");
    final jsonDecodeFile = jsonDecode(loadJsonFile);
    var jsonFile = jsonDecodeFile["events"];
    List<Events> listEvents = List.from(jsonFile)
        .map<Events>((data) => Events.fromJson(data))
        .toList();
    return listEvents;
  }
}
