import 'package:app_authentication/authentication.dart';
import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lisa_app/common/datas/providers/providers.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/reading/reading_list_state.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/common/utils/string_formater.dart';
import 'package:lisa_app/presentation/pages/home/widget/home_flex_row.dart';
import 'package:lisa_app/presentation/pages/home/widget/home_reading_card.dart';

import '../../widgets/book/book_card.dart';

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
                    HomeFlexRow(
                      title: '',
                      subtitle: 'Favorites ...',
                      child: _FavoritesList(ref: ref),
                    ),
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
    final List<SingleBook> singleBooks = ref.watch(readingListProvider);
    return Material(
      color: Colors.transparent,
      child: ref.watch<ReadingListState>(readingListNotifierProvider).maybeMap(
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
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: singleBook.length,
      itemBuilder: (BuildContext context, int index) {
        final SingleBook item = singleBook[index];
        return HomeReadingCard(
          title: item.volumeInfo!.title,
          author: item.volumeInfo!.authors.first,
          image: '${item.volumeInfo?.imageLinks?.medium}',
          isStarted: item.isStarted,
          numberOfPageRead: item.numberOfPageRead,
          percentage:
              '${(item!.numberOfPageRead / item!.volumeInfo!.pageCount * 100).toStringAsFixed(2)} %',
          pressRead: () => context.go(
            '${AppPage.reading.routePath}/${item.id}',
            extra: item,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 40);
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
    return Column(
      children: <Widget>[
        ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            itemCount: singleBooks.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 40);
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
            }),
      ],
    );
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
      textWidth: 140.w,
      positionActionButton: 80.w,
      auth: item.volumeInfo!.authors.first,
      image: '${item.volumeInfo?.imageLinks?.medium}',
      pressRead: pressRead,
      watchDetail: true,
      pressDetail: pressDetail,
      buttonLabel: 'Start to read',
    );
  }
}

// class _FavoritesList extends ConsumerWidget {
//   const _FavoritesList({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final List<SingleBook> singleBooks = ref.watch(favoritesListProvider);
//     return ref.watch<FavoriteListState>(favoriteListNotifierProvider).maybeMap(
//           orElse: () => const SizedBox.shrink(),
//           empty: (_) => SizedBox(
//             height: MediaQuery.of(context).size.height -
//                 AppBar().preferredSize.height -
//                 kBottomNavigationBarHeight -
//                 kToolbarHeight,
//             child: const Padding(
//               padding: EdgeInsets.all(58.0),
//               child: Center(
//                 child: Text(
//                   "You haven't added anything to favorites",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//             ),
//           ),
//           loading: (_) => const CircularProgressIndicator(),
//           loaded: (_) => FavoriteBookList(
//             singleBook: singleBooks,
//           ),
//         );
//   }
// }
//
// class FavoriteBookList extends StatelessWidget {
//   const FavoriteBookList({
//     super.key,
//     required this.singleBook,
//   });
//   final List<SingleBook> singleBook;
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       shrinkWrap: true,
//       physics: const ScrollPhysics(),
//       itemCount: singleBook.length,
//       itemBuilder: (BuildContext context, int index) {
//         final SingleBook item = singleBook[index];
//         return HomeFavoriteCard(
//           title: item.volumeInfo!.title,
//           author: item.volumeInfo!.authors.first,
//           imagePath: '${item.volumeInfo?.imageLinks?.medium}',
//           onTap: () => context.go(
//             '${AppPage.reading.routePath}/${item.id}',
//             extra: item,
//           ),
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) {
//         return const SizedBox(height: 40);
//       },
//     );
//   }
// }
