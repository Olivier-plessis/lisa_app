import 'package:flutter/material.dart';

import 'package:app_authentication/authentication.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/providers/providers.dart';
import 'package:lisa_app/common/domain/state/book/single_book_list_state.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationCurrentUserProvider, (_, Object? state) {});

    final UserCredentials? currentUser = ref.watch(authUserProvider).maybeWhen(
        authenticatedUser: (UserCredentials user) => user, orElse: () => null);

    final Iterable<SingleBook>? pendingBookCount = ref
        .watch<SingleBookListState>(readingListNotifierProvider)
        .whenOrNull(
          loaded: (List<SingleBook> singleBooks) => singleBooks
              .map((SingleBook e) => e)
              .toList()
              .where(
                  (SingleBook element) => element.status == BookStatus.pending),
        );
    final Iterable<SingleBook>? readingBookCount =
        ref.watch<SingleBookListState>(readingListNotifierProvider).whenOrNull(
              loaded: (List<SingleBook> singleBooks) => singleBooks
                  .map((SingleBook e) => e)
                  .toList()
                  .where((SingleBook element) =>
                      element.status == BookStatus.inProgress),
            );

    final Iterable<SingleBook>? finishedBookCount =
        ref.watch<SingleBookListState>(readingListNotifierProvider).whenOrNull(
              loaded: (List<SingleBook> singleBooks) => singleBooks
                  .map((SingleBook e) => e)
                  .toList()
                  .where((SingleBook element) =>
                      element.status == BookStatus.isFinished),
            );
    print(readingBookCount?.length);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: ElevatedButton(
                  onPressed: () => context.go('/'),
                  child: const Text('retour')),
              background: Hero(
                tag: 'avatar-${currentUser?.uid}',
                child:
                    Image.network('${currentUser?.photo}', fit: BoxFit.cover),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0).r,
              child: Column(
                children: [
                  StaggeredGrid.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1.3,
                        child: Container(
                          color: ColorTheme.secondaryContainerColor,
                          child: Text('reading : ${readingBookCount?.length}'),
                        ).paddedAll(12),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: Container(
                          color: ColorTheme.secondaryContainerColor,
                          child: Text('pending : ${pendingBookCount?.length}'),
                        ).paddedAll(12),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 1,
                        mainAxisCellCount: 1,
                        child: Container(
                          color: ColorTheme.secondaryContainerColor,
                          child:
                              Text('finished : ${finishedBookCount?.length}'),
                        ).paddedAll(12),
                      ),
                    ],
                  ),
                  InkWell(
                    child: const Text('logout'),
                    onTap: () =>
                        ref.read(authNotifierProvider.notifier).signOut(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
