import 'package:app_authentication/authentication.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

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
              title: Text("Item #${currentUser?.name}"),
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
