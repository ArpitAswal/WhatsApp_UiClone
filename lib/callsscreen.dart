import 'package:flutter/material.dart';
import 'package:whatsapp_ui/calldata.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  void initState() {
    super.initState();
    sortCallDate();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 75,
            width: MediaQuery.of(context).size.width,
            child: const ListTile(
              leading: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.link,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text(
                'Create call link',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                'Share a link for your WhatsApp call',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
          ),
          Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              //color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text('Recent ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
              )),
          for (int i = 0; i < data.length; i++)
            callStatus(
                data[i].avatar, data[i].name, data[i].callType, data[i].time),
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
                    text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                        text: "Your personal calls are ",
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
    );
  }

  Widget callStatus(String? image, String name, Icon call, String time) {
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
      subtitle: Row(
        children: [
          Container(
            child: call,
          ),
          Text(
            time,
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
      trailing: const Icon(Icons.call, color: Colors.teal),
    );
  }
}
