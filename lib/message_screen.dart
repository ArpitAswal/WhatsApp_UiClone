import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/chatsdata.dart';
import 'package:whatsapp_ui/messages.dart';
import 'package:flutter/foundation.dart' as foundation;

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key, required this.i});

  final int i;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late int ind;

  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  bool fileShow = false;
  FocusNode focus = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ind = widget.i;
    focus.addListener(() {
      if (focus.hasFocus) {
        setState(() {
          emojiShowing = false;
          fileShow = false;
        });
      }
    });
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
          leadingWidth: 16,
          titleSpacing: 0.0,
          title: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(data[ind].avatar ?? 'images/no_image.jpg',),
            ),
            title: Text(
              data[ind].name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            subtitle: const Text(
              "last seen today at 12:05",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.video_call,color: Colors.white,)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.call, color: Colors.white,)),
            PopupMenuButton(
              iconColor: Colors.white,
              color: Colors.white,
                onSelected: (value) {
                },
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                        value: "View Contact",
                        child: Text("View Contact")),
                    const PopupMenuItem(value: "Media,links and docs", child: Text("Media,links and docs")),
                    const PopupMenuItem(value: "Search", child: Text("Search")),
                    const PopupMenuItem(value: "Mute notifications", child: Text("Mute notifications")),
                    const PopupMenuItem(value: "Disappearing messages", child: Text("Disappearing messages")),
                    const PopupMenuItem(value: "Wallpaper", child: Text("Wallpaper")),
                    PopupMenuItem(
                      onTap: () {
                        const PopupMenuItem(
                            value: "View Contact",
                            child: Text("View Contact"));
                      },
                      child: Row(
                          children: [
                            const Text("More"),
                            SizedBox(width: MediaQuery
                                .of(context)
                                .size
                                .width / 3.75),
                            const Icon(Icons.arrow_right, color: Colors.black45,
                              size: 26,)
                          ]
                      ),)
                  ];
                }),
          ],
        ),
        body: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: WillPopScope(
            onWillPop: () {
              if (emojiShowing) {
                setState(() {
                  emojiShowing = false;
                });
              }
              else if (fileShow) {
                setState(() {
                  fileShow = false;
                });
              }
              else {
                Navigator.pop(context);
              }
              return Future.value(false);
            },
            child: Column(
              children: [
                Expanded(child: Messages()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width - 55,
                              height: 50,
                              child: Card(
                                margin: const EdgeInsets.only(
                                    left: 3, bottom: 6, top: 3, right: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: TextFormField(
                                  focusNode: focus,
                                  showCursor: true,

                                  cursorColor: const Color(0xFF128C7E),
                                  cursorWidth: 1.5,
                                  keyboardType: TextInputType.multiline,
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Message",
                                    hintStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: IconButton(
                                        color: const Color(0xFF128C7E),
                                        icon: const Icon(Icons.emoji_emotions_outlined
                                        ),
                                        onPressed: () {
                                          focus.unfocus();
                                          focus.canRequestFocus = false;
                                          setState(() {
                                            emojiShowing = !emojiShowing;
                                          });
                                        }
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          color: const Color(0xFF128C7E),
                                          icon: const Icon(Icons.attach_file),
                                          onPressed: () {
                                            focus.unfocus();
                                            focus.canRequestFocus = false;
                                            setState(() {
                                              fileShow = !fileShow;
                                            });
                                            showModalBottomSheet(

                                                backgroundColor: Colors
                                                    .transparent,
                                                context: context,
                                                builder: (builder) =>
                                                    bottomSheet());
                                          },
                                        ),
                                        IconButton(
                                          color: const Color(0xFF128C7E),
                                          icon: const Icon(
                                              Icons.currency_rupee_rounded),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          color: const Color(0xFF128C7E),
                                          icon: const Icon(Icons.camera_alt),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),

                                    contentPadding: const EdgeInsets.all(2),
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 3, bottom: 6, top: 3, right: 1),
                            child: CircleAvatar(
                                backgroundColor: const Color(0xFF128C7E),
                                radius: 25,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.mic, color: Colors.white))),
                          ),
                        ],
                      ),
                      Offstage(
                        offstage: !emojiShowing,
                        child: SizedBox(
                            height: 250,
                            child: EmojiPicker(
                              textEditingController: _controller,
                              config: Config(
                                columns: 7,
                                // Issue: https://github.com/flutter/flutter/issues/28894
                                emojiSizeMax: 32 *
                                    (foundation.defaultTargetPlatform ==
                                        TargetPlatform.android
                                        ? 1.30
                                        : 1.0),
                                verticalSpacing: 0,
                                horizontalSpacing: 0,
                                gridPadding: EdgeInsets.zero,
                                initCategory: Category.RECENT,
                                bgColor: const Color(0xFFF2F2F2),
                                indicatorColor: Colors.blue,
                                iconColor: Colors.grey,
                                iconColorSelected: Colors.blue,
                                backspaceColor: Colors.blue,
                                skinToneDialogBgColor: Colors.white,
                                skinToneIndicatorColor: Colors.grey,
                                enableSkinTones: true,
                                showRecentsTab: true,
                                recentsLimit: 28,
                                replaceEmojiOnLimitExceed: false,
                                noRecents: const Text(
                                  'No Recents',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black26),
                                  textAlign: TextAlign.center,
                                ),
                                loadingIndicator: const SizedBox.shrink(),
                                tabIndicatorAnimDuration: kTabScrollDuration,
                                categoryIcons: const CategoryIcons(),
                                buttonMode: ButtonMode.MATERIAL,
                                checkPlatformCompatibility: true,
                              ),
                            )),
                      ),
                    ],
                  ),

                )
              ],
            ),
          ),
        ));
  }

  Widget bottomSheet() {
    return Container(
      height: MediaQuery
      .of(context)
      .size
      .height
    * 0.36,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCreation(
                        Icons.insert_drive_file, Colors.indigo, "Document"),
                    const SizedBox(
                      width: 40,
                    ),
                    iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                    const SizedBox(
                      width: 40,
                    ),
                    iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCreation(Icons.headset, Colors.orange, "Audio"),
                    const SizedBox(
                      width: 45,
                    ),
                    iconCreation(Icons.location_pin, Colors.green, "Location"),
                    const SizedBox(
                      width: 40,
                    ),
                    iconCreation(
                        Icons.currency_rupee_rounded, Colors.teal, "Payment"),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 62,vertical: 5),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    iconCreation(Icons.person, Colors.blue, "Contact"),
                    const SizedBox(
                      width: 45,
                    ),
                    iconCreation(Icons.poll, Colors.teal, "Poll"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 23,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 21,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }
}