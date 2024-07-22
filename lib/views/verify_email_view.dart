import 'package:flutter/material.dart';
import 'package:mynotesapp/constants/routes.dart';
import 'package:mynotesapp/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: const Color.fromRGBO(100, 50, 150, 0.4),
      ),
      body: Column(
        children: [
          const Text('We\'ve sent you an email to verify your account.'),
          const Text(
            'If you haven\'nt received the mail. Please click the below button to send email again',
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text('Send email verification'),
          ),
          const Text(
            'Restart process here by clicking below button',
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              if (!context.mounted) return;
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('Restart'),
          ),
          const Text(
            'If you\'ve verified your account. Please click the below button to login',
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(loginRoute);
            },
            child: const Text('Email Verified? Click here to login'),
          ),
        ],
      ),
    );
  }
}
