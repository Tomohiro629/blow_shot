import 'package:blow_shot/app/blow_shot_page/blow_shot_page.dart';
import 'package:blow_shot/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home_page/home_page.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(authServiceProvider).getAuthState;

    return StreamBuilder<User?>(
      stream: authUser,
      builder: ((context, snapshot) {
        final isLoggedIn = snapshot.data != null;
        return isLoggedIn ? const BlowShotPage() : const HomePage();
      }),
    );
  }
}
