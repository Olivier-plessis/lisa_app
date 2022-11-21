import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lisa_app/common/datas/providers/providers.dart';
import 'package:lisa_app/common/domain/models/book/book.dart';
import 'package:lisa_app/common/domain/models/book/items.dart';
import 'package:lisa_app/common/domain/state/book_state.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/presentation/pages/search/search_bar.dart';
import 'package:lisa_app/presentation/widgets/book_poster_widget.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({
    super.key,
  });

  Color get secondaryColor => ColorTheme.secondaryColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BookState booksList = ref.watch(booksNotifierProvider);

    return Scaffold(
      backgroundColor: ColorTheme.tertiaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: InkWell(
              child: Icon(Icons.chevron_left, color: secondaryColor),
              onTap: () => context.goNamed(AppPage.home.routeName),
            ),
            title: const ATextHeadlineFive(
              content: 'Catalog books',
            ),
            expandedHeight: 140.0,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.only(top: 10),
              title: Material(
                type: MaterialType.transparency,
                child: BooksSearchBar(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: booksList.whenOrNull(
              loading: () => Column(
                children: [
                  const Center(
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: 10,
                      backgroundColor: ColorTheme.failureRed,
                    ),
                  ).paddedV(100),
                ],
              ),
              loaded: (Book books) {
                return BookList(books: books);
              },
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
    required this.books,
  });
  final Book books;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            itemCount: books.items!.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 40);
            },
            itemBuilder: (BuildContext context, int index) {
              final Items item = books.items![index];
              return _BookCard(
                item: item,
                onPressed: () => context.go(
                  '${AppPage.search.routePath}/${item.id}',
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
  final Items item;
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
                      imagePath: item.volumeInfo?.imageLinks?.thumbnail),
                ),
              ),
              Flexible(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //averageRating
                        if (item.volumeInfo!.averageRating != null)
                          RatingBarIndicator(
                            rating: item.volumeInfo!.averageRating!,
                            itemBuilder: (BuildContext context, int index) =>
                                const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemSize: 24.0,
                            unratedColor: Colors.amber.withAlpha(50),
                          ),
                        ATextHeadlineFive(content: '${item.volumeInfo!.title}'),
                        if (item.volumeInfo!.authors != null)
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
