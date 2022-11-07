import 'package:app_authentication/authentication.dart';
import 'package:app_ui/app_ui.dart';
import 'package:atomic_widget/atomic_widget.dart';
import 'package:atomic_widget/atoms/text/body/body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lisa_app/common/utils/string_formater.dart';
import 'package:lisa_app/generated/locale_keys.g.dart';
import 'package:lisa_app/generated/resources.dart';

class SignPage extends ConsumerWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: ColorTheme.tertiaryColor,
        systemNavigationBarColor: ColorTheme.secondaryColor,
        statusBarIconBrightness: Brightness.dark));

    // ref.read(authNotifierProvider.notifier).signIn()

    return Scaffold(
      backgroundColor: ColorTheme.secondaryColor,
      body: Stack(
        children: <Widget>[
          // The containers in the background
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .94,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: ColorTheme.tertiaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 56.0.h, horizontal: 24.0.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(Images.svgLisa,
                          semanticsLabel: 'Lisa sign logo'),
                      ATextHeadlineOne(
                          content: LocaleKeys.discover_a_new_world
                              .tr()
                              .toCapitalized()),
                      Gap(20.0.h),
                      ATextBodyTwo(
                        content: LocaleKeys.find_more_book_and_study.tr(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .90,
            ),
            child: ElevatedButton(
              onPressed: () => showModal(context,
                  () => ref.read(authNotifierProvider.notifier).signIn()),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(64, 64),
                shape: const CircleBorder(),
                side: const BorderSide(
                  width: 5.0,
                  color: ColorTheme.tertiaryColor,
                ),
                padding: const EdgeInsets.all(0),
                backgroundColor:
                    ColorTheme.orangeLightColor, // <-- Button color
              ),
              child: const Icon(
                Icons.arrow_forward_outlined,
                size: 40,
                color: ColorTheme.tertiaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> showModal(dynamic context, VoidCallback? onPressed) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0))),
        backgroundColor: ColorTheme.secondaryColor,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height - 100.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 38.0.h,
                ),
                ATextHeadlineTwo(
                    content: LocaleKeys.authenticate_you.tr().toCapitalized()),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 24)
                            .r,
                    side: BorderSide(
                        width: 1,
                        color: ColorTheme.secondaryColor.withOpacity(0.44)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).r,
                    ),
                    textStyle:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Container(
                      //   height: 18.0.r,
                      //   width: 18.0.r,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(image: icon, fit: BoxFit.cover),
                      //     shape: BoxShape.circle,
                      //   ),
                      // ),
                      // SizedBox(width: 14.w),
                      Text(
                        "Sign with google",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorTheme.secondaryColor.withOpacity(0.54)),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          );
        });
  }
}
