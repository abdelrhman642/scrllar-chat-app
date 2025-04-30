import 'package:chhat_app/constans.dart';

class Message {
  final String massage;

  Message(this.massage);
  factory Message.fromJson(jsondata) {
    return Message(jsondata[KMessage]);
  }
}
