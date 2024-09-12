class StatusData {
  final String name;
  final String time;
  final String? avatar;

  StatusData({required this.name, required this.time, this.avatar});
}

List<StatusData> recentStatus = [
  StatusData(
    name: "Kakashi",
    time: "Today,10:20 pm",
    avatar: "images/kakashi.jpg",
  ),
  StatusData(
    name: "Gara",
    time: "Today,14:23 pm",
    avatar: "images/gara.jpg",
  ),
  StatusData(
    name: "Dabi",
    time: "Yesterday,23:20 pm",
    avatar: "images/dabi.jpg",
  ),
  StatusData(
    name: "Jiraiya",
    time: "Yesterday,8:30 am",
    avatar: "images/jiraiya.jpg",
  ),
];

List<StatusData> viewedstatus = [
  StatusData(
    name: "Ichigo",
    time: "Today,10:20 pm",
    avatar: "images/ichigo.jpg",
  ),
  StatusData(
    name: "Itachi",
    time: "Today,14:23 pm",
    avatar: "images/itachi.jpg",
  ),
  StatusData(
    name: "Minato",
    time: "Yesterday,23:20 pm",
    avatar: "images/minato.jpg",
  ),
  StatusData(
    name: "Obito",
    time: "Yesterday,8:30 am",
    avatar: "images/obito.jpg",
  ),
];
