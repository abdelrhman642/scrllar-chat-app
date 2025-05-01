import 'package:chhat_app/constans.dart';

class Message {
  final String ?massage;
  final String ?id;
    final String ?email;

  Message(this.massage, this.id,this.email);
  factory Message.fromJson(jsondata) {
    return Message(jsondata[KMessage], jsondata['id'],jsondata['user']);
  }
}
