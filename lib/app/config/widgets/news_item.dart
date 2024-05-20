import 'package:flutter/material.dart';
import 'package:news_finder_task/app/models/news.dart';
import 'package:news_finder_task/generated/assets.dart';

class NewsItem extends StatelessWidget {
  final NewsModel item;

  const NewsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(10),
      height: size.height * .15,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: double.infinity,
              child: Image.network(
                item.urlToImage ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  Asset.images.png.placeHolder,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  3,
                  (index) => RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: index == 0
                              ? 'title:'
                              : index == 1
                                  ? 'author:'
                                  : 'source:',
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
                          text: index == 0
                              ? item.title
                              : index == 1
                                  ? item.author ?? '---------'
                                  : item.source ?? '---------',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
