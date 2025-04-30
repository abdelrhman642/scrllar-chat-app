import 'package:chhat_app/constans.dart';
import 'package:chhat_app/helper/show_snack_bar.dart';
import 'package:chhat_app/pages/chat_page.dart';
import 'package:chhat_app/widgets/custom_buttom.dart';
import 'package:chhat_app/widgets/custom_textfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResgisterPage extends StatefulWidget {
  ResgisterPage({Key? key}) : super(key: key);
  static String id = 'resgisterpage';

  @override
  State<ResgisterPage> createState() => _ResgisterPageState();
}

class _ResgisterPageState extends State<ResgisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KprimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                SizedBox(height: 250),
                // Image.asset('assets/images/scholar.png', height: 100),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Scholar Chat',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 32,
                //         fontWeight: FontWeight.bold,
                //         fontFamily: 'Pacifico',
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    Text(
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomFromTextFiled(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                SizedBox(height: 10),
                CustomFromTextFiled(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(height: 20),
                CustomButtom(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await resgiserUser(
                          
                        );
                        Navigator.pushNamed(context, ChatPage.id);
                        // showSnackBar(context, 'Success', color: Colors.green);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          showSnackBar(
                            context,
                            'Weak password',
                            color: Colors.red,
                          );
                        } else if (ex.code == 'email-already-in-use') {
                          showSnackBar(
                            context,
                            'Email already exist',
                            color: Colors.red,
                          );
                        }
                      } catch (ex) {
                        showSnackBar(
                          context,
                          'there is an error',
                          color: Colors.red,
                        );
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
                  },

                  text: 'REGISTER',
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Arealy have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, 'loginpage');
                      },
                      child: Text(
                        '  Login',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> resgiserUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
