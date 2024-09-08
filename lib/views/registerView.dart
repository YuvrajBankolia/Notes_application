// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/constant/routes.dart';
import 'package:mynotes/services/auth/auth_exceptioins.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';
import 'package:mynotes/services/auth/bloc/auth_state.dart';
import 'package:mynotes/utilities/error_dialog.dart';
import 'dart:developer';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("okk 1");
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        log("okk 2");
        if (state is AuthStateRegistering) {
          log("okk 3");
          if (state.exception is WeakPasswordAuthException) {
            log("okk 4");
            await showErrorDialog(context, 'Weak Password');
            log("okk 5");
          } else if (state.exception is EmailAlreadyInUsedAuthException) {
            log("okk 6");
            await showErrorDialog(context, 'email isALready in used');
            log("okk 7");
          } else if (state.exception is GenericAuthException) {
            log("okk 8");
            await showErrorDialog(context, 'failed to register');
            log("okk 9");
          } else if (state.exception is InvalidEmailAuthException) {
            log("okk 10");
            await showErrorDialog(context, 'Invalid Email');
            log("okk 11");
          }
          log("okk 12");
        }
        log("okk 13");
      },
      // return Container(color: Colors.purple);
      // return const Placeholder(color: Colors.purple);
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  const InputDecoration(hintText: '  Enter your email address'),
            ),
            TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration:
                    const InputDecoration(hintText: '  Enter your password')),
            TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                context.read<AuthBloc>().add(
                      AuthEventRegister(
                        email,
                        password,
                      ),
                    );
              },
              child: const Text('Register'),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      const AuthEventLogOut(),
                    );
              },
              child: const Text('Already Register ? Login Here'),
            )
          ],
        ),
      ),
    );
  }
}
