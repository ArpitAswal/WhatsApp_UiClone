import 'package:flutter/material.dart';

class NewCommunity extends StatelessWidget {
  NewCommunity({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white)),
        title: const Text(
          'New community',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF075E54),
          child: const Icon(Icons.arrow_forward, color: Colors.white, size: 23),
          onPressed: () {}),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 125),
            height: 100,
            width: 130,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 95,
                    height: 95,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24.0)),
                    ),
                  ),
                ),
                const Center(
                    child: Icon(
                  Icons.groups,
                  color: Colors.white,
                  size: 72,
                )),
                const Positioned(
                  bottom: 1,
                  right: 4.5,
                  child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.camera_alt,
                          color: Colors.white, size: 15)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.black54,
              width: 1.5,
            ))),
            width: MediaQuery.of(context).size.width / 1.1,
            child: TextFormField(
              cursorColor: Colors.teal,
              showCursor: true,
              controller: _controller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  labelText: 'Community name',
                  labelStyle: TextStyle(color: Colors.black54)),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: const Border(
                    bottom: BorderSide(
                  color: Colors.black54,
                  width: 1.5,
                ))),
            child: TextFormField(
              cursorColor: Colors.teal,
              showCursor: true,
              controller: _controller,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  labelText: 'Community description',
                  labelStyle: TextStyle(color: Colors.black54)),
            ),
          )
        ],
      ),
    );
  }
}
