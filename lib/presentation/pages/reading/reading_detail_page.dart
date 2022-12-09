import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lisa_app/common/datas/providers/providers.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/book/single_book_list_state.dart';

import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/presentation/widgets/book/book_description.dart';
import 'package:lisa_app/presentation/widgets/book/book_header.dart';
import 'package:lisa_app/presentation/widgets/book/book_page_categories.dart';
import 'package:lisa_app/presentation/widgets/book/book_poster_details.dart';

class ReadingDetailsPage extends ConsumerWidget {
  const ReadingDetailsPage(
      {super.key, required this.singleBookId, required this.book});
  final String singleBookId;
  final SingleBook? book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SingleBookListState currentBook =
        ref.watch<SingleBookListState>(readingListNotifierProvider);

    currentBook.maybeMap(
      loaded: (value) => value.singleBooks.first.id == singleBookId,
      orElse: () {},
    );
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                currentBook.maybeMap(
                    orElse: () => const SizedBox.shrink(),
                    loaded: (data) {
                      final SingleBook? book = data.singleBooks
                          .map((SingleBook e) => e)
                          .firstWhereOrNull((SingleBook element) =>
                              element.id == singleBookId);
                      return CurrentBookDetail(
                        book: book,
                        ref: ref,
                      );
                    }),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CurrentBookDetail extends StatefulWidget {
  const CurrentBookDetail({
    super.key,
    required this.book,
    required this.ref,
  });
  final SingleBook? book;
  final WidgetRef ref;

  @override
  State<CurrentBookDetail> createState() => _CurrentBookDetailState();
}

class _CurrentBookDetailState extends State<CurrentBookDetail> {
  late final TextEditingController _numberOfPageReadController;

  @override
  void initState() {
    super.initState();

    _numberOfPageReadController =
        TextEditingController(text: widget.book?.numberOfPageRead.toString());
  }

  @override
  Widget build(BuildContext context) {
    return widget.book == null
        ? const SizedBox.shrink()
        : Column(
            children: <Widget>[
              BookHeader(
                title: widget.book!.volumeInfo!.title,
                authors: widget.book!.volumeInfo!.authors.first,
                publisher: widget.book!.volumeInfo!.publisher,
                publishedDate: widget.book!.volumeInfo!.publishedDate,
              ),
              const Gap(20.0),
              BookPosterDetails(
                imageLink: '${widget.book!.volumeInfo?.imageLinks?.medium}',
                onTapButton: () => widget.ref
                    .read(readingNotifierProvider.notifier)
                    .startToReadBook(book: widget.book!),
                buttonText: 'start to read',
                restoreToFavorite: true,
                onTapToFavorite: () => {
                  widget.ref
                      .read(readingNotifierProvider.notifier)
                      .removeFromReadingList(book: widget.book!),
                  widget.ref
                      .read(favoriteNotifierProvider.notifier)
                      .addToFavorites(book: widget.book!),
                  context.goNamed(AppPage.reading.routeName),
                },
                deleteTo: true,
                onTapDelete: () {
                  widget.ref
                      .read(readingNotifierProvider.notifier)
                      .removeFromReadingList(book: widget.book!);
                  context.goNamed(AppPage.reading.routeName);
                },
                starToRead: widget.book!.isStarted,
              ),
              BookPageCategories(
                pageCount:
                    int.parse(widget.book!.volumeInfo!.pageCount.toString()),
                categories: '${widget.book!.volumeInfo?.categories}',
                numberOfPageRead: widget.book!.numberOfPageRead.toString(),
                isStarted: widget.book!.isStarted,
                onTap: () {
                  _displayTextInputDialog(context);
                },
              ),
              if (DateTime.tryParse(widget.book!.startedAt.toString()) != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.all(8.0.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: ColorTheme.mainGreenColor),
                        child: Text(
                            'Start since : ${DateFormat.yMMMd().format(
                              DateTime.parse(widget.book!.startedAt.toString()),
                            )}',
                            style: const TextStyle(
                                color: ColorTheme.secondaryColor,
                                fontSize: 12))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('percentage',
                            style: TextStyle(fontSize: 10)),
                        Text(
                            '${(widget.book!.numberOfPageRead / widget.book!.volumeInfo!.pageCount * 100).toStringAsFixed(2)} %',
                            style: textTheme.subtitle2!
                                .copyWith(color: ColorTheme.secondaryColor)),
                      ],
                    )
                  ],
                ).paddedLR(20.0.w),
              BookDescription(
                description: widget.book!.volumeInfo!.description,
              ),
              const Gap(40.0),
            ],
          );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    final String str = widget.book!.volumeInfo!.pageCount.toString();
    final Map<String, int> map = {};
    for (int i = 0; i < str.length; i++) {
      final int count = map[str[i]] ?? 0;
      map[str[i]] = count + 1;
    }

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Modify number of page read'),
            content: TextField(
              onChanged: (String value) {},
              controller: _numberOfPageReadController,
              decoration:
                  InputDecoration(hintText: _numberOfPageReadController.text),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(map.length),
              ],
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              onSubmitted: (String value) {
                try {
                  if (int.parse(value) <=
                      widget.book!.volumeInfo!.pageCount.toInt()) {
                    widget.ref
                        .read(readingNotifierProvider.notifier)
                        .updatePageReadBook(
                            book: widget.book!,
                            numberOfPageRead: int.parse(value));
                    Navigator.of(context).pop();
                  }
                } catch (e) {}
              },
            ),
          );
        });
  }
}
