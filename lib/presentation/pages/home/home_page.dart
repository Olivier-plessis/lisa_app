import 'package:flutter/material.dart';

import 'package:app_authentication/authentication.dart';
import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/common/utils/string_formater.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationCurrentUserProvider, (_, Object? state) {});

    final UserCredentials? currentUser = ref.watch(authUserProvider).maybeWhen(
        authenticatedUser: (UserCredentials user) => user, orElse: () => null);

    return SafeArea(
      child: currentUser == null
          ? const SizedBox.shrink()
          : Scaffold(
              backgroundColor: ColorTheme.tertiaryColor,
              appBar: AppBar(
                toolbarHeight: 84.0,
                title: ATextHeadlineFive(
                  content: 'Welcome ${getFirstWords(currentUser.name, 1)}',
                ).paddedL(32),
                actions: [
                  IconButton(
                    onPressed: () =>
                        GoRouter.of(context).go(AppPage.profile.routePath),
                    icon: ClipRRect(
                      borderRadius: BorderRadius.circular(16), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(34.0),
                        child:
                            Image.network(currentUser.photo, fit: BoxFit.cover),
                      ),
                    ),
                  ).paddedR(8.0),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'My Books',
                      style: Theme.of(context).textTheme.headline1,
                    ).paddedL(48),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: const RotatedBox(
                            quarterTurns: -1,
                            child: Text('in progress'),
                          ).paddedL(12),
                        ),
                        Flexible(
                            flex: 6,
                            child: Column(
                              children: [Text('My Book')],
                            ))
                      ],
                    ),
                  ],
                ),
              )),
    );
  }
}
