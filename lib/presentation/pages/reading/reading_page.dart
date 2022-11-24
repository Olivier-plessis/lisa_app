import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lisa_app/common/datas/providers/providers.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/reading/reading_list_state.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/presentation/widgets/book/book_card.dart';
import 'package:lisa_app/presentation/widgets/book/book_sliver_app_bar.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CustomScrollView(physics: ClampingScrollPhysics(), slivers: <Widget>[
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
                title: 'My reading list &',
                subtitle: 'Blabla',
              )),
        ),
      ),
      _FavoritesList(),
    ]);
  }
}

class _FavoritesList extends ConsumerWidget {
  const _FavoritesList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SingleBook> singleBooks = ref.watch(readingListProvider);

    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (singleBooks.isNotEmpty)
            ref.watch<ReadingListState>(readingListNotifierProvider).maybeMap(
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
                          "You haven't added anything to reading list",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  loaded: (_) => BookList(
                    singlebooks: singleBooks,
                  ),
                ),
        ],
      ),
    );
  }
}

class BookList extends StatelessWidget {
  const BookList({
    super.key,
    required this.singlebooks,
  });
  final List<SingleBook> singlebooks;
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
              return const SizedBox(height: 20);
            },
            itemBuilder: (BuildContext context, int index) {
              final SingleBook item = singlebooks[index];
              return _BookListCard(
                item: item,
                pressRead: () => context.go(
                  '${AppPage.reading.routePath}/${item.id}',
                  extra: item,
                ),
              );
            }),
        const Gap(50),
      ],
    );
  }
}

class _BookListCard extends StatelessWidget {
  const _BookListCard({
    required this.item,
    required this.pressRead,
  });
  final SingleBook item;
  final Function() pressRead;

  @override
  Widget build(BuildContext context) {
    return BookCard(
      title: item.volumeInfo!.title,
      auth: item.volumeInfo!.authors.first,
      image: '${item.volumeInfo?.imageLinks?.medium}',
      pressRead: pressRead,
    );
  }
}

class BookInfo extends StatelessWidget {
  const BookInfo({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
            child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text('My reading list &',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: FontSizeTheme.titleLight.toDouble())),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * .005),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 0),
              child: Text(
                'Blabla',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: FontSizeTheme.titleLight.toDouble()),
              ),
            ),
          ],
        )),
      ],
    );
  }
}
