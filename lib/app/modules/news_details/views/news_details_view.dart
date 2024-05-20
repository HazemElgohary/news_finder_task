import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_finder_task/app/config/widgets/default_button.dart';
import 'package:news_finder_task/app/config/widgets/details_text_widget.dart';
import 'package:news_finder_task/app/helpers/extentions/date_time.dart';
import 'package:news_finder_task/generated/assets.dart';

import '../controllers/news_details_controller.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'news_details'.tr,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DefaultButton(
          text: 'articles\'s website',
          onTap: () {},
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        children: [
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: controller.item.urlToImage == null
                  ? DecorationImage(
                      image: AssetImage(Asset.images.png.placeHolder),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Image.network(
              controller.item.urlToImage ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                Asset.images.png.placeHolder,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ...List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.all(8),
              child: DetailsTextWidget(
                title: index == 0
                    ? 'title:'
                    : index == 1
                        ? 'author:'
                        : index == 2
                            ? 'source:'
                            : index == 3
                                ? 'publish at:'
                                : 'description:',
                detail: index == 0
                    ? controller.item.title
                    : index == 1
                        ? controller.item.author ?? '---------'
                        : index == 2
                            ? controller.item.source
                            : index == 3
                                ? controller.item.publishedAt.toCustomFormat()
                                : controller.item.description ?? '---------',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
