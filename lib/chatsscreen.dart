import 'package:flutter/material.dart';
import 'package:whatsapp_ui/chatsdata.dart';
import 'package:whatsapp_ui/message_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final ScrollController _controllerOne = ScrollController();

  @override
  void initState() {
    super.initState();
    sortDate();
  }

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thickness: 5,
      thumbColor: Colors.black26,
      trackVisibility: true,
      controller: _controllerOne,
      child: ListView.builder(
          controller: _controllerOne,
          itemCount: data.length,
          itemBuilder: (context, i) => Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 20.0),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.black54,
                      backgroundImage:
                          AssetImage(data[i].avatar ?? 'images/no_image.jpg'),
                    ),
                    title: Text(data[i].name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Row(
                      children: [
                        const Icon(Icons.done_all),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(data[i].message,
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                    trailing: Text(
                      data[i].date,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessageScreen(i: i)));
                    },
                  ),
                ],
              )),
    );
  }
}
