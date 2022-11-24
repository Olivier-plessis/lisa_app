import 'package:flutter/material.dart';

import 'package:lisa_app/common/utils/string_formater.dart';
import 'package:lisa_app/presentation/widgets/expandable_text.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Description : ', style: TextStyle(fontSize: 10)),
          ExpandableText(
            Utilities.removeAllHtmlTags(description),
            trimLines: 7,
          ),
        ],
      ),
    );
  }
}
