import 'package:flutter/material.dart';

import 'package:app_authentication/authentication.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0).r,
      child: InkWell(
        child: Text(
          'sign out',
        ),
        onTap: () => ref.read(authNotifierProvider.notifier).signOut(),
      ),
    );
  }
}
