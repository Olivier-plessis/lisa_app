import 'package:flutter/material.dart';

import 'package:app_authentication/authentication.dart';
import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/providers/providers.dart';
import 'package:lisa_app/common/domain/state/book/single_book_list_state.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/common/utils/string_formater.dart';
import 'package:lisa_app/presentation/pages/home/widget/home_book_card.dart';
import 'package:lisa_app/presentation/pages/home/widget/home_flex_row.dart';
import 'package:lisa_app/presentation/pages/home/widget/home_reading_card.dart';
import 'package:lisa_app/presentation/widgets/book/book_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationCurrentUserProvider, (_, Object? state) {});

    final UserCredentials? currentUser = ref.watch(authUserProvider).maybeWhen(
        authenticatedUser: (UserCredentials user) => user, orElse: () => null);

    final SingleBook? pendingStatus =
        ref.watch<SingleBookListState>(readingListNotifierProvider).whenOrNull(
              loaded: (List<SingleBook> singleBooks) =>
                  singleBooks.firstWhereOrNull(
                      (SingleBook element) => element.status.name == 'pending'),
            );

    final List<SingleBook> favorites = ref.watch(favoritesListProvider);

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
                actions: <Widget>[
                  IconButton(
                    onPressed: () =>
                        GoRouter.of(context).go(AppPage.profile.routePath),
                    icon: ClipRRect(
                      borderRadius: BorderRadius.circular(16), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(28.0),
                        child:
                            Image.network(currentUser.photo, fit: BoxFit.cover),
                      ),
                    ),
                  ).paddedR(8.0),
                ],
              ),
              body: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'My Books',
                      style: textTheme.headline1,
                    ).paddedL(48.0.w),
                    HomeFlexRow(
                      title: 'Continue ',
                      subtitle: 'reading ...',
                      child:
                          SizedBox(height: 215.h, child: const _ReadingList()),
                    ),
                    if (pendingStatus != null)
                      HomeFlexRow(
                        title: '',
                        subtitle: 'Pending ...',
                        child: SizedBox(
                            height: 185.h, child: const _PendingList()),
                      ),
                    if (favorites.isNotEmpty)
                      HomeFlexRow(
                        title: '',
                        subtitle: 'Favorites ...',
                        child: _FavoritesList(ref: ref),
                      ).paddedB(50.0.h),
                  ],
                ),
              )),
    );
  }
}

class _ReadingList extends ConsumerWidget {
  const _ReadingList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SingleBook> singleBooks = ref.watch(homeReadingListProvider);
    return Material(
      color: Colors.transparent,
      child: ref
          .watch<SingleBookListState>(readingListNotifierProvider)
          .maybeMap(
            orElse: () => const SizedBox.shrink(),
            empty: (_) => SizedBox(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  kBottomNavigationBarHeight -
                  kToolbarHeight,
              child: Card(
                color: ColorTheme.mainLightColor,
                shadowColor: ColorTheme.bodyTextColor,
                elevation: 2,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorTheme.orangeColor),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  margin: const EdgeInsets.all(12),
                  width: 175.w,
                  child: const Center(
                    child: Text("You haven't added anything to reading list",
                        style: TextStyle(color: ColorTheme.secondaryColor),
                        textAlign: TextAlign.center),
                  ).paddedH(12.h),
                ),
              ).paddedAll(12.sm),
            ),
            loaded: (_) => ReadingBookList(
              singleBook: singleBooks,
            ),
          ),
    );
  }
}

class ReadingBookList extends StatelessWidget {
  const ReadingBookList({
    super.key,
    required this.singleBook,
  });
  final List<SingleBook> singleBook;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: singleBook.length,
      itemBuilder: (BuildContext context, int index) {
        final SingleBook item = singleBook[index];
        return item.status != BookStatus.inProgress
            ? const SizedBox.shrink()
            : HomeReadingCard(
                title: item.volumeInfo!.title,
                author: item.volumeInfo!.authors.first,
                image: '${item.volumeInfo?.imageLinks?.medium}',
                numberOfPageRead: item.numberOfPageRead,
                percentage:
                    '${(item.numberOfPageRead / item.volumeInfo!.pageCount * 100).toStringAsFixed(2)} %',
                pressRead: () => context.go(
                  '${AppPage.reading.routePath}/${item.id}',
                  extra: item,
                ),
              );
      },
    );
  }
}

class _PendingList extends ConsumerWidget {
  const _PendingList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SingleBook> singleBooks = ref.watch(homeReadingListProvider);
    return Material(
      color: Colors.transparent,
      child: ref
          .watch<SingleBookListState>(readingListNotifierProvider)
          .maybeMap(
            orElse: () => const SizedBox.shrink(),
            empty: (_) => SizedBox(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  kBottomNavigationBarHeight -
                  kToolbarHeight,
              child: Card(
                color: ColorTheme.mainLightColor,
                shadowColor: ColorTheme.bodyTextColor,
                elevation: 2,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorTheme.orangeColor),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  margin: const EdgeInsets.all(12),
                  width: 175.w,
                  child: const Center(
                    child: Text("You haven't added anything to reading list",
                        style: TextStyle(color: ColorTheme.secondaryColor),
                        textAlign: TextAlign.center),
                  ).paddedH(12.h),
                ),
              ).paddedAll(12.sm),
            ),
            loaded: (_) => PendingBookList(
              singleBook: singleBooks,
            ),
          ),
    );
  }
}

class PendingBookList extends StatelessWidget {
  const PendingBookList({
    super.key,
    required this.singleBook,
  });
  final List<SingleBook> singleBook;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: singleBook.length,
      itemBuilder: (BuildContext context, int index) {
        final SingleBook item = singleBook[index];
        return item.status != BookStatus.pending
            ? const SizedBox.shrink()
            : SmallBookCard(
                image: '${item.volumeInfo?.imageLinks?.medium}',
                pressRead: () => context.go(
                  '${AppPage.reading.routePath}/${item.id}',
                  extra: item,
                ),
              );
      },
    );
  }
}

class _FavoritesList extends StatelessWidget {
  const _FavoritesList({
    required this.ref,
  });
  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    final List<SingleBook> singleBooks = ref.watch(favoritesListProvider);
    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: singleBooks.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
        itemBuilder: (BuildContext context, int index) {
          final SingleBook item = singleBooks[index];
          return _FavoriteListCard(
            item: item,
            pressDetail: () => context.go(
              '${AppPage.favorite.routePath}/${item.id}',
              extra: item,
            ),
            pressRead: () {
              ref
                  .read(favoriteNotifierProvider.notifier)
                  .removeFromFavorites(book: item);
              ref
                  .read(readingNotifierProvider.notifier)
                  .addBookToReadingList(book: item);
              context.go(
                '${AppPage.reading.routePath}/${item.id}',
                extra: item,
              );
            },
          );
        });
  }
}

class _FavoriteListCard extends StatelessWidget {
  const _FavoriteListCard({
    required this.item,
    required this.pressDetail,
    required this.pressRead,
  });
  final SingleBook item;
  final Function() pressDetail;
  final Function() pressRead;

  @override
  Widget build(BuildContext context) {
    return BookCard(
      title: item.volumeInfo!.title,
      textWidth: 150.w,
      positionActionButton: 64.w,
      auth: item.volumeInfo!.authors.first,
      image: '${item.volumeInfo?.imageLinks?.medium}',
      pressRead: pressRead,
      watchDetail: true,
      pressDetail: pressDetail,
      buttonLabel: 'Start to read',
    );
  }
}
