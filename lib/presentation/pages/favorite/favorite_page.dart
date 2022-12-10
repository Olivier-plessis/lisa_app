import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lisa_app/common/datas/providers/providers.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/book/single_book_list_state.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/presentation/widgets/book/book_card.dart';

import 'package:lisa_app/presentation/widgets/book/book_sliver_app_bar.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 184.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(top: 10),
              title: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                      top: size.height * .12,
                      left: size.width * .1,
                      right: size.width * .02),
                  height: size.height * .48,
                  decoration: const BoxDecoration(
                    color: ColorTheme.orangeLightColor,
                    // image: DecorationImage(
                    //   image: AssetImage(Images.bg),
                    //   fit: BoxFit.fitWidth,
                    // ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: BookSliverAppBar(
                    size: size,
                    title: 'My favorite list &',
                    subtitle: 'Blabla',
                  )),
            ),
          ),
          const _FavoritesList(),
        ]);
  }
}

class _FavoritesList extends ConsumerWidget {
  const _FavoritesList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SingleBook> singleBooks = ref.watch(favoritesListProvider);

    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ref.watch<SingleBookListState>(favoriteListNotifierProvider).maybeMap(
                orElse: () => const SizedBox.shrink(),
                empty: (_) => SizedBox(
                  height: MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      kBottomNavigationBarHeight -
                      kToolbarHeight,
                  child: const Padding(
                    padding: EdgeInsets.all(58.0),
                    child: Center(
                      child: Text(
                        "You haven't added anything to favorites",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                loading: (_) => const CircularProgressIndicator(),
                loaded: (_) => _BookListCard(
                  singlebooks: singleBooks,
                  ref: ref,
                ),
              )
        ],
      ),
    );
  }
}

class _BookListCard extends StatelessWidget {
  const _BookListCard({
    required this.singlebooks,
    required this.ref,
  });
  final List<SingleBook> singlebooks;
  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            itemCount: singlebooks.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 40);
            },
            itemBuilder: (BuildContext context, int index) {
              final SingleBook item = singlebooks[index];
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
      auth: item.volumeInfo!.authors.first,
      image: '${item.volumeInfo?.imageLinks?.medium}',
      pressRead: pressRead,
      watchDetail: true,
      pressDetail: pressDetail,
      buttonLabel: 'Add to reading list',
    );
  }
}
