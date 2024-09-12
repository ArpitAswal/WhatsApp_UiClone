import 'package:whatsapp_ui/chatsdata.dart';

List<ChatsData> saveContact = List.from(data); //..addAll(data);

List<ChatsData> extraContact = [
  ChatsData(
    name: 'Hashirama',
    message: 'Hye',
    date: "2023-02-20",
    //avatar: null
    select: false,
  ),
  ChatsData(
    name: 'Eren Yeager',
    message: 'Hye',
    date: "2023-02-20",
    // avatar: null
    select: false,
  ),
  ChatsData(
    name: 'Son Goku',
    message: 'Hye',
    date: "2023-02-20",
    // avatar: null
    select: false,
  ),
  ChatsData(
    name: "Kakashi",
    message: "Hey",
    date: "2023-02-20",
    select: false,
  ),
];

var allContact = List.from(saveContact).addAll(extraContact);

void sortOrder() {
  saveContact.sort((a, b) => (a.name.compareTo(b.name)));
  for (int i = 0; i < saveContact.length; i++) {
    if (i == 0) {
      saveContact[i].message = 'Message yourself';
    } else {
      saveContact[i].message = 'Hye I am ${saveContact[i].name}';
    }
    extraContact.sort((a, b) => a.name.compareTo(b.name));
  }
}
