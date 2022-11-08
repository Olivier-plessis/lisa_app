import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class MSocialButton extends StatelessWidget {
  const MSocialButton(
      {Key? key,
      required this.label,
      required this.icon,
      required this.onPressed})
      : super(key: key);
  final String label;
  final dynamic icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 15,
      width: size.width * 0.8,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24).r,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10).r,
          ),
          textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 18.0.r,
              width: 18.0.r,
              decoration: BoxDecoration(
                image: DecorationImage(image: icon, fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 14.w),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorTheme.secondaryColor.withOpacity(0.54),
                  fontWeight: FontWeightTheme.semiBold),
            ),
          ],
        )),
      ),
    );
  }
}
