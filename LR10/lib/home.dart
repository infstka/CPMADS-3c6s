import 'package:firebase_auth/firebase_auth.dart';
import 'package:lr10/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('LR10');
  }

  Widget _userID() {
    return Text(user?.email ?? 'user email');
  }

  Widget _signOut() {
    return ElevatedButton(onPressed: signOut, child: const Text('sign out'));
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userID(),
            _signOut(),
          ],
        ),
      ),
    );
  }
}