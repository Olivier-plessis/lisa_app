import 'package:flutter/material.dart';

import 'package:app_authentication/authentication.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationCurrentUserProvider, (_, Object? state) {});

    final UserCredentials? currentUser = ref.watch(authUserProvider).maybeWhen(
        authenticatedUser: (UserCredentials user) => user, orElse: () => null);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: ElevatedButton(
                  onPressed: () => context.go('/'), child: Text('retour')),
              background: Hero(
                tag: "avatar-${currentUser?.uid}",
                child:
                    Image.network('${currentUser?.photo}', fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
