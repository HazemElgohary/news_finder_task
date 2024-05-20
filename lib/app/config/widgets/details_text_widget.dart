import 'package:flutter/material.dart';

class DetailsTextWidget extends StatelessWidget {
  final String title;
  final String detail;
  final int? maxLines;

  const DetailsTextWidget({
    super.key,
    required this.title,
    required this.detail,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            detail,
            maxLines: maxLines,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const WidgetSpan(
            child: SizedBox(
              width: 10,
            ),
          ),
          TextSpan(
            text: detail,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
