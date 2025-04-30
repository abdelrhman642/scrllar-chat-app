import 'package:chhat_app/constans.dart';
import 'package:chhat_app/model/message.dart';
import 'package:chhat_app/widgets/chat_buble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  TextEditingController controller = TextEditingController();

  CollectionReference massages = FirebaseFirestore.instance.collection(
    KMessageCollection,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: massages.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> massagesList = [];
          for (int i = 0; i < (snapshot.data?. docs. length??0); i++) {
            massagesList. add (Message. fromJson(snapshot.data?.docs [i].data));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: KprimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(KLogo, height: 50),
                  Text(
                    'Scholar Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: massagesList.length,
                    itemBuilder: (context, index) {
                      return ChatBuble(
                        massage: massagesList[index],
                        );
                    },
                  ),
                ),
                SafeArea(
                  bottom: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        massages.add({
                          'massage': data,
                          'time': DateTime.now(),
                          'user':
                              FirebaseAuth.instance.currentUser?.email ?? '',
                        });
                        controller.clear();
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your Massage',
                        suffixIcon: Icon(Icons.send, color: KprimaryColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: KprimaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: KprimaryColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text('loading........');
        }
      },
    );
  }
} 