import 'package:flutter/material.dart';

class CallData {
  final String name;
  final String time;
  final String? avatar;
  final Icon callType;

  CallData(
      {required this.name,
      required this.time,
      this.avatar,
      required this.callType});

  static Icon callReceived = const Icon(
    Icons.call_received,
    size: 18,
    color: Colors.green,
  );
  static Icon callMissed = const Icon(
    Icons.call_missed,
    size: 18,
    color: Colors.red,
  );
}

List<CallData> data = [
  CallData(
    name: "Kakashi",
    time: "28 February, 9:51 pm",
    callType: CallData.callReceived,
    avatar: "images/kakashi.jpg",
  ),
  CallData(
    name: "Minato",
    time: "26 February, 8:39 pm",
    callType: CallData.callMissed,
    avatar: "images/minato.jpg",
  ),
  CallData(
    name: "Itachi",
    time: "26 February, 8:39 pm",
    callType: CallData.callReceived,
    avatar: "images/itachi.jpg",
  ),
  CallData(
    name: "Dabi",
    time: "21 February, 8:15 pm",
    callType: CallData.callMissed,
    avatar: "images/dabi.jpg",
  ),
  CallData(
    name: "Obito",
    time: "24 February, 12:12 am",
    callType: CallData.callMissed,
    avatar: "images/obito.jpg",
  ),
  CallData(
    name: "Ichigo",
    time: "06 February, 8:00 am",
    callType: CallData.callMissed,
    avatar: "images/ichigo.jpg",
  ),
];

sortCallDate() {
  data.sort((a, b) {
    return (b.time).compareTo((a.time));
  });
}
