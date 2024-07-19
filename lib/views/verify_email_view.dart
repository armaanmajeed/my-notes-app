import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: const Color.fromRGBO(100, 50, 150, 0.4),
      ),
      body: Column(
        children: [
          const Text('Please verify your email address'),
          TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                user?.sendEmailVerification();
              },
              child: const Text('Send email verification'))
        ],
      ),
    );
  }
}
