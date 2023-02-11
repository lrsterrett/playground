import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/core/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  _signInWithGoogle(BuildContext context) {
    context.read<AuthenticationService>().signInWithGoogle().then((_) {
      GoRouter.of(context).go('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(Buttons.Google,
                  onPressed: () => _signInWithGoogle(context)),
            ],
          ),
        ),
      ),
    );
  }
}
