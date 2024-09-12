import 'package:flutter/material.dart';
import 'package:whatsapp_ui/chatsdata.dart';

import 'contactsdata.dart';
import 'message_screen.dart';
import 'newgroup.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  void initState() {
    super.initState();
    sortOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white)),
        titleSpacing: 0.0,
        title: const ListTile(
            title: Text(
              "Select contact",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "15 contacts",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          PopupMenuButton(
              iconColor: Colors.white,
              color: Colors.white,
              onSelected: (value) {},
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                      value: "Invite a friend",
                      child: Text("Invite a friend")),
                  const PopupMenuItem(
                      value: "Contacts",
                      child: Text("Contacts")),
                  const PopupMenuItem(value: "Refresh", child: Text("Refresh")),
                  const PopupMenuItem(value: "Help", child: Text("Help")),
                ];
              }),
        ],
      ),
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 5,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const NewGroup()));
                },
                child: const ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.group),
                  ),
                  title: Text(
                    'New group',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.person_add),
                ),
                title: Text(
                  'New contact',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.groups),
                ),
                title: Text(
                  'New community',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                child: Text(
                  'Contacts on Whatsapp',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey.shade700,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 8),
              for (int i = 0; i < data.length; i++)
                ListTile(
                  title: InkWell(
                    child: Text(saveContact[i].name),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessageScreen(i: i)));
                    },
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        saveContact[i].avatar ?? 'images/no_image.jpg'),
                    radius: 20,
                  ),
                  subtitle: Text(saveContact[i].message),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                child: Text(
                  'Invite to Whatsapp',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey.shade700,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              for (int i = 0; i < extraContact.length; i++)
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                        extraContact[i].avatar ?? 'images/no_image.jpg'),
                  ),
                  title: InkWell(
                    child: Text(extraContact[i].name),
                    onTap: () {
                      //Navigator.push(context,MaterialPageRoute(builder: (context)=>message_screen(i)));
                    },
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      'Invite',
                      style:
                          TextStyle(color: Colors.teal.shade700, fontSize: 15),
                    ),
                  ),
                ),
              const ListTile(
                leading: CircleAvatar(
                  foregroundColor: Colors.black45,
                  backgroundColor: Colors.black12,
                  child: Icon(Icons.share),
                ),
                title: Text(
                  'Share invite link',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //iconColor: Colors.black54
              ),
              const ListTile(
                leading: CircleAvatar(
                    foregroundColor: Colors.black45,
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.question_mark)),
                title: Text(
                  'Contacts help',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //        iconColor: Colors.black54
              )
            ],
          ),
        ),
      ),
    );
  }
}
