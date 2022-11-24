import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
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

class ReadingDetailsPage extends ConsumerWidget {
  const ReadingDetailsPage(
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
            onTap: () => context.goNamed(AppPage.reading.routeName),
          ),
          title: const ATextHeadlineFive(
            content: 'reading book detail',
          ),
          expandedHeight: 64.0,
        ),
        SliverToBoxAdapter(
          child: favoriteBook.whenOrNull(
            loaded: (SingleBook book) {
              final List<String>? split =
                  book.volumeInfo?.categories.first.split('/');
              final Map<int, String> values = {
                for (int i = 0; i < split!.length; i++) i: split![i]
              };

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookHeader(
                      title: '${book.volumeInfo?.title}',
                      authors: book.volumeInfo!.authors!.first,
                      publisher: '${book.volumeInfo?.publisher}',
                      publishedDate: '${book.volumeInfo?.publishedDate}',
                    ),
                    const Gap(20.0),
                    BookPosterDetails(
                      imageLink: '${book.volumeInfo?.imageLinks?.medium}',
                      onTapButton: () => print('test'),
                      buttonText: 'start to read',
                      restoreToFavorite: true,
                      onTapToFavorite: () => {
                        ref
                            .read(readingNotifierProvider.notifier)
                            .removeFromReadingList(book: book),
                        ref
                            .read(favoriteNotifierProvider.notifier)
                            .addToFavorites(book: book),
                        context.goNamed(AppPage.reading.routeName),
                      },
                      deleteTo: true,
                      onTapDelete: () {
                        ref
                            .read(readingNotifierProvider.notifier)
                            .removeFromReadingList(book: book);
                        context.goNamed(AppPage.reading.routeName);
                      },
                    ),
                    BookPageCategories(
                      pageCount: '${book.volumeInfo?.pageCount}',
                      categories: '${book.volumeInfo?.categories.first}',
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
