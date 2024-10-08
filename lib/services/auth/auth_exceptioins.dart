//  Login Exceptions
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}
//   register exceptions

class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUsedAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

// generic ewxceptions

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
