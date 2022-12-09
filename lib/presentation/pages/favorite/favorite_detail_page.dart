import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lisa_app/common/datas/providers/providers.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/book/single_book_state.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/presentation/widgets/book/book_description.dart';
import 'package:lisa_app/presentation/widgets/book/book_header.dart';
import 'package:lisa_app/presentation/widgets/book/book_page_categories.dart';
import 'package:lisa_app/presentation/widgets/book/book_poster_details.dart';

class FavoriteDetailsPage extends ConsumerWidget {
  const FavoriteDetailsPage(
      {super.key, required this.singleBookId, required this.singleBook});
  final String singleBookId;
  final SingleBook? singleBook;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SingleBookState favoriteBook =
        ref.watch(singleBookFamilyProvider(singleBookId));

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            child: const Icon(
              Icons.chevron_left,
              color: ColorTheme.secondaryColor,
            ),
            onTap: () => context.goNamed(AppPage.favorite.routeName),
          ),
          title: const ATextHeadlineFive(
            content: 'Favorite book detail',
          ),
          expandedHeight: 64.0,
        ),
        SliverToBoxAdapter(
          child: favoriteBook.whenOrNull(
            loaded: (SingleBook book) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    BookHeader(
                      title: '${book.volumeInfo?.title}',
                      authors: book.volumeInfo!.authors.first,
                      publisher: '${book.volumeInfo?.publisher}',
                      publishedDate: '${book.volumeInfo?.publishedDate}',
                    ),
                    const Gap(20.0),
                    BookPosterDetails(
                      imageLink: '${book.volumeInfo?.imageLinks?.medium}',
                      deleteTo: true,
                      deleteButtonLeftPosition: 130,
                      onTapDelete: () {
                        ref
                            .read(favoriteNotifierProvider.notifier)
                            .removeFromFavorites(book: book);
                        context.goNamed(AppPage.favorite.routeName);
                      },
                      onTapButton: () {
                        ref
                            .read(favoriteNotifierProvider.notifier)
                            .removeFromFavorites(book: book);

                        ref
                            .read(readingNotifierProvider.notifier)
                            .addBookToReadingList(book: book);

                        context.go(
                          '${AppPage.reading.routePath}/${book.id}',
                          extra: book,
                        );
                      },
                      buttonText: 'add to reading list',
                    ),
                    BookPageCategories(
                      pageCount:
                          int.parse(book.volumeInfo!.pageCount.toString()),
                      categories: '${book.volumeInfo?.categories}',
                    ),
                    BookDescription(
                      description: book.volumeInfo!.description,
                    ),
                    const Gap(40.0),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
