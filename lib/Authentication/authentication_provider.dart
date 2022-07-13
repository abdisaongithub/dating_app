import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthenticationNotifier, String>(
  (ref) {
    return AuthenticationNotifier();
  },
);

class AuthenticationNotifier extends StateNotifier<String> {
  AuthenticationNotifier() : super('');
}
