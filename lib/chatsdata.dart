import 'package:whatsapp_ui/verificationscreen.dart';

class ChatsData {
  String name;
  String message;
  String date;
  String? avatar;
  bool select;

  ChatsData({
    required this.name,
    required this.message,
    required this.date,
    this.avatar,
    required this.select,
  });
}

List<ChatsData> data = <ChatsData>[
  ChatsData(
      name:
          '${VerificationScreenState.countryCode} ${VerificationScreenState.controller.text} (You)',
      message: "Hey",
      date: "2023-02-20",
      avatar: "images/kakashi.jpg",
      select: false),
  ChatsData(
      name: "Dabi",
      message: "Hey",
      date: "2023-02-18",
      avatar: "images/dabi.jpg",
      select: false),
  ChatsData(
      name: "Itachi",
      message: "Hey",
      date: "2023-02-02",
      // avatar:"images/itachi.jpg",
      select: false),
  ChatsData(
      name: "Jiraiya",
      message: "Hey",
      date: "2023-02-20",
      avatar: "images/jiraiya.jpg",
      select: false),
  ChatsData(
      name: "Minato",
      message: "Hey",
      date: "2023-01-25",
      avatar: "images/minato.jpg",
      select: false),
  ChatsData(
      name: "Ichigo",
      message: "Hey",
      date: "2023-02-20",
      avatar: "images/ichigo.jpg",
      select: false),
  ChatsData(
      name: "Obito",
      message: "Hey",
      date: "2023-02-20",
      avatar: "images/obito.jpg",
      select: false),
  ChatsData(
      name: "Gara",
      message: "Hey",
      date: "2023-02-05",
      avatar: "images/gara.jpg",
      select: false),
  ChatsData(
      name: "Gaba",
      message: "Hey",
      date: "2023-01-30",
      avatar: "images/gara.jpg",
      select: false),
  ChatsData(
      name: "Kakashi",
      message: "Hey",
      date: "2023-01-20",
      avatar: "images/kakashi.jpg",
      select: false),
  ChatsData(
      name: "Dabi",
      message: "Hey",
      date: "2023-02-20",
      avatar: "images/dabi.jpg",
      select: false),
  ChatsData(
      name: "Itachi",
      message: "Hey",
      date: "2023-02-10",
      avatar: "images/itachi.jpg",
      select: false),
  ChatsData(
      name: "Jiraiya",
      message: "Hey",
      date: "2022-12-20",
      avatar: "images/jiraiyatwo.jpg",
      select: false),
];

sortDate() {
  data.sort((a, b) {
    return DateTime.parse(b.date).compareTo(DateTime.parse(a.date));
  });
}
