import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_finder_task/app/config/widgets/details_text_widget.dart';
import 'package:news_finder_task/app/models/news.dart';
import 'package:news_finder_task/app/routes/app_pages.dart';
import 'package:news_finder_task/generated/assets.dart';

class NewsItem extends StatelessWidget {
  final NewsModel item;

  const NewsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.NEWS_DETAILS, arguments: item);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: size.height * .15,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  image: item.urlToImage == null
                      ? DecorationImage(
                          image: AssetImage(Asset.images.png.placeHolder),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
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
                    (index) => DetailsTextWidget(
                      title: index == 0
                          ? 'title:'
                          : index == 1
                              ? 'author:'
                              : 'source:',
                      detail: index == 0
                          ? item.title
                          : index == 1
                              ? item.author ?? '---------'
                              : item.source,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
