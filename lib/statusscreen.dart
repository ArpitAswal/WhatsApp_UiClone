import 'package:flutter/material.dart';
import 'package:whatsapp_ui/statusdata.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ListTile(
                  leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage:
                                const AssetImage('images/kakashi.jpg'),
                            backgroundColor: Colors.blueGrey[200],
                          ),
                          const Positioned(
                            bottom: 6,
                            right: 5,
                            child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.green,
                                child: Icon(Icons.add,
                                    color: Colors.white, size: 15)),
                          ),
                        ],
                      )),
                  title: const Text('My status',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  subtitle: const Text('Tap to add status here',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                )),
            Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text('Recent status',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                )),
            for (int i = 0; i < recentStatus.length; i++)
              status(recentStatus[i].avatar, recentStatus[i].name,
                  recentStatus[i].time),
            const SizedBox(
              height: 5,
            ),
            Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text('Viewed status',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                )),
            for (int i = 0; i < viewedstatus.length; i++)
              status(viewedstatus[i].avatar, viewedstatus[i].name,
                  viewedstatus[i].time),
            const Divider(),
            SizedBox(
              height: 190,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock, color: Colors.black54, size: 14),
                  RichText(
                      //textAlign: TextAlign.center,
                      text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                          text: "Your status updates are ",
                          style: TextStyle(color: Colors.grey[600])),
                      const TextSpan(
                          text: "end-to-end enrypted",
                          style: TextStyle(color: Colors.teal))
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget status(String? image, String name, String time) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: Colors.blueGrey,
        backgroundImage: AssetImage(image ?? 'images/no_image.jpg'),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(time,
          style: const TextStyle(fontSize: 13, color: Colors.black54)),
    );
  }
}
