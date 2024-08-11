import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth user;
import 'package:flutter/foundation.dart';
@immutable
class AuthUser{

   final bool isEmailVerified;
  const AuthUser(this.isEmailVerified);
}