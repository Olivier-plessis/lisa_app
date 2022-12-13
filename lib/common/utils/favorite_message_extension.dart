import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lisa_app/common/domain/providers/providers.dart';
import 'package:lisa_app/common/domain/state/book/single_book_state.dart';
import 'package:lisa_app/presentation/widgets/snackbar/content_type.dart';
import 'package:lisa_app/presentation/widgets/snackbar/snackbar_widget.dart';

extension FavoriteMessageExtention on WidgetRef {
  void favoriteStateListener(BuildContext context) {
    listen<SingleBookState>(
      favoriteNotifierProvider,
      (_, SingleBookState state) {
        state.maybeMap(
          orElse: () {},
          data: (state) {
            print('state ==> $state');
            if (state.book == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  elevation: 0,
                  padding: const EdgeInsets.only(bottom: 14.0).r,
                  clipBehavior: Clip.none,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: SnackBarWidget(
                    title: 'Removed from favorites',
                    message: 'your book has been removed to favorite list',
                    contentType: ContentType.success,
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  elevation: 0,
                  padding: const EdgeInsets.only(bottom: 14.0).r,
                  clipBehavior: Clip.none,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: SnackBarWidget(
                    title: 'Add to favorites',
                    message: 'your book has been addedd to favorite list',
                    contentType: ContentType.success,
                  ),
                ),
              );
            }
          },
          error: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 0,
                padding: const EdgeInsets.only(bottom: 14.0).r,
                clipBehavior: Clip.none,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: SnackBarWidget(
                  title: 'Oups',
                  message: 'error',
                  contentType: ContentType.failure,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
