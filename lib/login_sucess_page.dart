import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterall/todolist/todolist.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class LoginSucessPage extends StatelessWidget {
  LoginSucessPage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  void signOutUser() async {
    await FirebaseAuth.instance.signOut();
    const MyApp();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title : Text(
          'Task management',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle : Theme.of(context).textTheme.displayLarge,
            fontSize: 24,
            fontStyle : FontStyle.normal,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: signOutUser,
            icon: const Icon(Icons.login, size:30,),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const ToDoList();
          },
          itemCount: 10,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add , size: 30, color: Colors.white,),
      ),
    );
  }
}