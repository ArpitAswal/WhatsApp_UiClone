import 'package:flutter/material.dart';
import 'package:whatsapp_ui/countryselect_screen.dart';
import 'package:whatsapp_ui/otpscreen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => VerificationScreenState();
}

class VerificationScreenState extends State<VerificationScreen> {
  String countryName = "choose a country";
  static String countryCode = "";

  static TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Enter your Phone number",
            style: TextStyle(
                color: Colors.teal,
                fontSize: 18,
                wordSpacing: 1,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
                onSelected: (value) {},
                icon: const Icon(Icons.more_vert, color: Colors.teal),
                color: Colors.white,
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                        value: "Link a device", child: Text("Link a device")),
                    const PopupMenuItem(value: "Help", child: Text("Help")),
                  ];
                })
          ],
        ),
        body: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'WhatsApp will need to verify your phone number. ',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const Text(
                  "What's my number?",
                  style: TextStyle(fontSize: 14, color: Colors.cyan),
                ),
                const SizedBox(
                  height: 15,
                ),
                countryCard(),
                const SizedBox(height: 5),
                number(),
                const SizedBox(
                  height: 12,
                ),
                const Center(
                    child: Text('Carrier charges may apply',
                        style: TextStyle(color: Colors.black54))),
                Expanded(child: Container()),
                InkWell(
                  onTap: () {
                    if (controller.text.length < 10) {
                      showDialog2();
                    } else if (controller.text.length > 10) {
                      showDialog3();
                    } else {
                      dialogBox();
                    }
                  },
                  child: Container(
                      color: Colors.teal[900],
                      height: 38,
                      width: 72,
                      child: const Center(
                        child: Text('Next',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white)),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Center(
                      child: Text('This version of WhatsApp is in Beta',
                          style: TextStyle(color: Colors.black54))),
                ),
              ],
            )));
  }

  Widget countryCard() {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CountrySelectScreen()),
        ).then((value) {
          setState(() {
            countryName = value.name;
            countryCode = value.code;
          });
        }).onError((error, stackTrace) {
          var snackBar = const SnackBar(
              backgroundColor: Colors.grey,
              content: Text(
                "you haven't selected a country",
                style: TextStyle(color: Colors.white),
              ));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.teal,
          width: 1.8,
        ))),
        child: Row(
          children: [
            Expanded(
                child: Center(
                    child: Text(countryName,
                        style: const TextStyle(fontSize: 15)))),
            const Icon(Icons.arrow_drop_down, color: Colors.teal)
          ],
        ),
      ),
    );
  }

  Widget number() {
    return Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Container(
              width: 60,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.teal,
                width: 1.8,
              ))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  const Text("+",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54)),
                  const SizedBox(
                    width: 10,
                  ),
                  if (countryCode.length > 1)
                    Text(countryCode.substring(1),
                        style: const TextStyle(
                          fontSize: 15,
                        ))
                  else
                    Text(countryCode,
                        style: const TextStyle(
                          fontSize: 15,
                        )),
                ],
              )),
          const SizedBox(
            width: 30,
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.teal,
              width: 1.8,
            ))),
            width: MediaQuery.of(context).size.width / 1.5 - 95,
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  hintText: 'phone number'),
            ),
          )
        ]));
  }

  Future<void> dialogBox() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            actionsPadding: const EdgeInsets.only(bottom: 4.0, right: 8.0),
            contentPadding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 18.0,bottom: 4.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('You entered the phone number',
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
                Text("$countryCode ${controller.text}",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54)),
                const Text(
                    'Is this OK, or would you like to edit the number?',
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'EDIT',
                    style: TextStyle(color: Colors.teal, fontSize: 16),
                  )),
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpScreen(
                                controller.text.toString(), countryCode)));
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.teal, fontSize: 16),
                  ))
            ],
          );
        });
  }

  Future<void> showDialog2() {
    return showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            actionsPadding: const EdgeInsets.only(bottom: 4.0, right: 8.0),
            contentPadding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 18.0,bottom: 8.0),
            content: Text(
                'The phone number you entered is too short for the country:$countryName.\nInclude your area code if you have not',
                style: const  TextStyle(fontSize: 14, color: Colors.black54)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok',
                      style: TextStyle(
                        fontSize: 16,
                      )))
            ],
          );
        });
  }

  Future<void> showDialog3() {
    return showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            actionsPadding: const EdgeInsets.only(bottom: 4.0, right: 8.0),
            contentPadding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 18.0,bottom: 8.0),
            content: Text(
                "The phone number you entered is too long for the country:$countryName",
                style: const TextStyle(fontSize: 14, color: Colors.black54)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok', style: TextStyle(fontSize: 16),))
            ],
          );
        });
  }
}
