import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constant/routes.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/login_view.dart';
import 'package:mynotes/views/registerView.dart';
import 'package:mynotes/views/verify_email_view.dart';
// import 'dart:developer' as devtools show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
// djfsfjsoifjofj
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            // print(user);
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                // print('hello');
                return const NotesView();
                // print('Email is verified');
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          // return const Text('Done');
          // if (user?.emailVerified ?? false) {
          //   return const Text('Done');
          // } else {
          //   return const VerifyEmailView();
          // }
          // return const LoginView(); //HomePage();
          default:
            return const CircularProgressIndicator();
          // return const Text('Loading...');
        }
      },
    );
  }
}

// enum MenuAction { logout }

// class NotesView extends StatefulWidget {
//   const NotesView({super.key});

//   @override
//   State<NotesView> createState() => _NotesViewState();
// }

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Main UI'),
          backgroundColor: Colors.blue,
          // backgroundColor : Colors.blue
          actions: [
            PopupMenuButton<MenuAction>(
              onSelected: (value) async {
                switch (value) {
                  case MenuAction.logout:
                    final shouldLogout = await showLogOutDialog(context);
                    // devtools.log(shouldLogout.toString());
                    // break;
                    if (shouldLogout) {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login/',
                        (_) => false,
                      );
                    }
                }
              },

              // devtools.log(value.toString());
              itemBuilder: (context) {
                return const [
                  PopupMenuItem<MenuAction>(
                      value: MenuAction.logout, child: Text('Log Out')),
                ];
              },
            )
          ]),
      body: const Text('hellow world'),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign out'),
        content: const Text('Are you sure you want to sign out'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('LogOut')),
        ],
      );
    },
  ).then((value) => value ?? false);
}
