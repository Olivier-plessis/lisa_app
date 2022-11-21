import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lisa_app/common/datas/providers/providers.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/favorite/favorite_list_state.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/presentation/widgets/book_poster_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        backgroundColor: ColorTheme.tertiaryColor,
        body: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: <Widget>[
              _FavoritesList(),
            ]),
      ),
    );
  }
}

class _FavoritesList extends ConsumerWidget {
  const _FavoritesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SingleBook> singleBooks = ref.watch(favoritesListProvider);

    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (singleBooks.isNotEmpty)
            ref.watch<FavoriteListState>(favoriteListNotifierProvider).maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  empty: (_) => SizedBox(
                    height: MediaQuery.of(context).size.height -
                        AppBar().preferredSize.height -
                        kBottomNavigationBarHeight -
                        kToolbarHeight,
                    child: Padding(
                      padding: const EdgeInsets.all(58.0),
                      child: const Center(
                        child: Text(
                          "You haven't added anything to favorites",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  loading: (_) => const CircularProgressIndicator(),
                  loaded: (_) => BookList(
                    singlebooks: singleBooks,
                  ),
                )
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
              return const SizedBox(height: 40);
            },
            itemBuilder: (BuildContext context, int index) {
              final SingleBook item = singlebooks[index];
              return _BookCard(
                item: item,
                onPressed: () => context.go(
                  '${AppPage.favorite.routePath}/${item.id}',
                  extra: item,
                ),
              );
            }),
      ],
    );
  }
}

class _BookCard extends StatelessWidget {
  const _BookCard({
    required this.item,
    this.onPressed,
  });
  final SingleBook item;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 18, 33, 0.08),
            blurRadius: 10,
            offset: Offset(3, 6),
          )
        ],
      ),
      child: Material(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            16,
          ),
        ),
        color: Colors.white,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
          onTap: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Transform.translate(
                  offset: const Offset(0, -22),
                  child: BookPoster(
                      imagePath: item.volumeInfo?.imageLinks?.medium),
                ),
              ),
              Flexible(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ATextHeadlineFive(content: item.volumeInfo!.title),
                        if (item.volumeInfo!.authors.isNotEmpty)
                          ATextHeadlineSix(
                              content: item.volumeInfo!.authors!.first)
                        else
                          const SizedBox.shrink(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 18.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorTheme.secondaryColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text('Discovered')),
                          ],
                        )
                      ],
                    ).paddedL(12.0),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
