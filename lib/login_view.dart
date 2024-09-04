import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/constant/routes.dart';
import 'package:mynotes/services/auth/auth_exceptioins.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';
import 'package:mynotes/services/auth/bloc/auth_state.dart';
import 'package:mynotes/utilities/error_dialog.dart';
import 'dart:developer';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    log("correct 1");
    _email = TextEditingController();
    log("correct 2");
    _password = TextEditingController();
    log("correct 3");
    super.initState();
    log("correc 4");
  }

  @override
  void dispose() {
    log("correct 5");
    _email.dispose();
    log("correct 6");
    _password.dispose();
    log("correct 7");
    super.dispose();
    log("correct 8");
  }

  @override
  Widget build(BuildContext context) {
    log("correct 9");
    // return Container(color: Colors.purple);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
            decoration: const InputDecoration(
              hintText: '  Enter your password here  ',
            ),
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) async {
              log("correct 10");
              if (state is AuthStateLoggedOut) {
                log("correct 11");
                if (state.exception is UserNotFoundAuthException) {
                  log("correct 12");
                  await showErrorDialog(context, 'User nOt Found');
                  log("correct 13");
                } else if (state.exception is WrongPasswordAuthException) {
                  log("correct 14");
                  await showErrorDialog(context, 'Wrong Credentials');
                  log("correct 15");
                } else if (state.exception is GenericAuthException) {
                  log("correct 16");
                  await showErrorDialog(context, 'Authentication Error');
                  log("correct 17");
                }
                log("correct 18");
              }
              log("correct 19");
            },
            child: TextButton(
              onPressed: () async {
                log("correct 20");
                final email = _email.text;
                final password = _password.text;
                context.read<AuthBloc>().add(
                      AuthEventLogIn(
                        email,
                        password,
                      ),
                    );
              },
              child: const Text('Login'),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                // '/register/',
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('Note Registered Yet ? Register Here !'),
          )
        ],
      ),
    );
  }
}
