import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:whatsapp_ui/callsscreen.dart';
import 'package:whatsapp_ui/chatsscreen.dart';
import 'package:whatsapp_ui/contactsscreen.dart';
import 'package:whatsapp_ui/statusscreen.dart';

import 'communityscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> topTab = <Tab>[
    const Tab(icon: Icon(Icons.groups, color: Colors.white)),
    const Tab(
      child: Text(
        "Chats",
        style: TextStyle(color: Colors.white),
      ),
    ),
    const Tab(
      child: Text(
        "Status",
        style: TextStyle(color: Colors.white),
      ),
    ),
    const Tab(
      child: Text(
        "Calls",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      initialIndex: 1,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (_tabController.index == 1) {
      await SystemNavigator.pop();
    }
    Future.delayed(const Duration(milliseconds: 100), () {
      _tabController.index = 1;
    });

    return _tabController.index == 1;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _onWillPop();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'WhatsApp',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.camera_alt_outlined, color: Colors.white)),
            _tabController.index != 0
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, color: Colors.white))
                : Container(),
            if (_tabController.index == 1)
              PopupMenuButton(
                onSelected: (value) {},
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                        value: "New Group", child: Text("New Group")),
                    const PopupMenuItem(
                        value: "New Broadcast", child: Text("New Broadcast")),
                    const PopupMenuItem(
                        value: "Linked Devices", child: Text("Linked Devices")),
                    const PopupMenuItem(
                        value: "Starred Devices",
                        child: Text("Starred Devices")),
                    const PopupMenuItem(
                        value: "Payments", child: Text("Payments")),
                    const PopupMenuItem(
                        value: "Settings", child: Text("Settings")),
                  ];
                },
                color: Colors.white,
                iconColor: Colors.white,
              )
            else if (_tabController.index == 2)
              PopupMenuButton(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 40,
                  ),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                          value: "Status privacy",
                          child: Text("Status privacy")),
                      const PopupMenuItem(
                          value: "Settings", child: Text("Settings")),
                    ];
                  },
                  color: Colors.white,
                  iconColor: Colors.white)
            else if (_tabController.index == 3)
              PopupMenuButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                constraints: const BoxConstraints(
                  minWidth: 40,
                ),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                        value: "Clear call log", child: Text("Clear call log")),
                    const PopupMenuItem(
                        value: "Settings", child: Text("Settings")),
                  ];
                },
                color: Colors.white,
                iconColor: Colors.white,
              )
            else
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                        value: "Settings", child: Text("Settings")),
                  ];
                },
                color: Colors.white,
                iconColor: Colors.white,
              )
          ],
          bottom: TabBar(
            tabs: topTab,
            indicatorColor: Colors.white,
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            CommunityScreen(),
            ChatsScreen(),
            StatusScreen(),
            CallsScreen(),
          ],
        ),
        floatingActionButton: _getFAB(),
      ),
    );
  }

  _getFAB() {
    if (_tabController.index == 1) {
      return FloatingActionButton(
          backgroundColor: const Color(0xFF075E54),
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContactsScreen()));
          });
    } else if (_tabController.index == 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white70,
            elevation: 9,
            child: Container(
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffE1E8EB).withOpacity(0.35),
                    spreadRadius: 8,
                    blurRadius: 4,
                    offset: const Offset(1, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.black54,
                size: 23,
                shadows: [
                  Shadow(
                    color: Color(0xffE1E8EB),
                    offset: Offset(0.2, 0.5),
                    blurRadius: 5.0,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: const Color(0xFF075E54),
            onPressed: () {},
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        ],
      );
    } else if (_tabController.index == 3) {
      return FloatingActionButton(
        backgroundColor: const Color(0xFF075E54),
        onPressed: () {},
        child: const Icon(
          Icons.add_call,
          color: Colors.white,
        ),
      );
    } else {
      return null;
    }
  }
}
