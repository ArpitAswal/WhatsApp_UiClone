import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:whatsapp_ui/verificationscreen.dart';
import 'homescreen.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen(this.phone, this.code, {super.key});

  final String phone;
  final String code;

  final otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.black54,
        ),
        title: Text('Verify $code $phone',
            style: const TextStyle(color: Colors.teal, fontSize: 16)),
        actions: [
          PopupMenuButton(
              onSelected: (value) {},
              color: Colors.grey,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(value: "Help", child: Text("Help")),
                ];
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(side: BorderSide(color: Colors.white)),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        child: const Icon(Icons.cleaning_services),
        onPressed: () {
          otpController.clear();
        },
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Waiting to automatically detect an SMS sent to ',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' $code $phone.',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const VerificationScreen()));
                    },
                    child: Text(
                      ' Wrong number?',
                      style: TextStyle(fontSize: 16, color: Colors.cyan[800]),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              OTPTextField(
                  controller: otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 28,
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  keyboardType: TextInputType.number,
                  onChanged: (pin) {},
                  onCompleted: (pin) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const HomeScreen(title: 'WhatsApp'),
                        ));
                  }),
              const SizedBox(
                height: 20,
              ),
              Text('Enter 6-digit code',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.teal,
                    size: 24,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Resend SMS',
                    style: TextStyle(color: Colors.teal, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1.5,
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.teal,
                    size: 24,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Call Me',
                    style: TextStyle(color: Colors.teal, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
