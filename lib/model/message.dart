import 'package:chhat_app/constans.dart';

class Message {
  final String massage;
  final String id;
  Message(this.massage, this.id);
  factory Message.fromJson(jsondata) {
    return Message(jsondata[KMessage], jsondata['id']);
  }
}
