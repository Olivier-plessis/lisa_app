import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.text, {
    super.key,
    this.trimLines = 2,
  });

  final String text;
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    const Color colorClickableText = ColorTheme.orangeColor;
    final TextSpan link = TextSpan(
        text: _readMore ? '... read more' : ' read less',
        style: const TextStyle(
          color: colorClickableText,
        ),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    final Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;

        final TextSpan text = TextSpan(
          text: widget.text,
        );

        final TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection.rtl,
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final Size linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final Size textSize = textPainter.size;
        // Get the endIndex of data
        int? endIndex;
        final TextPosition pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset);
        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
            style:
                TextStyle(color: ColorTheme.bodyTextColor, fontSize: 12.0.sp),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
            style:
                TextStyle(color: ColorTheme.bodyTextColor, fontSize: 12.0.sp),
          );
        }
        return RichText(
          text: textSpan,
        );
      },
    );
    return result;
  }
}
