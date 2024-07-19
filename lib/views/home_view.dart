// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: const Color.fromRGBO(100, 50, 150, 0.4),
      ),
      body: Column(
        children: [
          const Text('Welcome to home page'),
          TextButton(
              onPressed: () {
                // final user = FirebaseAuth.instance.currentUser;
                // user?.sendEmailVerification();
              },
              child: const Text('Logout'))
        ],
      ),
    );
  }
}
