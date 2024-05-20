import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_finder_task/app/config/widgets/categories_list_widget.dart';
import 'package:news_finder_task/app/config/widgets/news_item.dart';
import 'package:news_finder_task/app/config/widgets/news_loading_item.dart';

import '../controllers/news_screen_controller.dart';

class NewsScreenView extends GetView<NewsScreenController> {
  const NewsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'news'.tr,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 70,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: Colors.grey)),
                ),
                child: Obx(
                  () => CategoriesListWidget(
                    selected: controller.selectedCategory.value,
                    onChanged: (value) {
                      controller.selectedCategory.value = value;
                    },
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: Obx(
              () => controller.loading.value
                  ? SliverList.separated(
                      itemBuilder: (context, index) => const NewsLoadingItem(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: 5,
                    )
                  : SliverList.separated(
                      itemBuilder: (context, index) {
                        if (index < controller.news.length) {
                          return NewsItem(
                            item: controller.news[index],
                          );
                        } else {
                          return const NewsLoadingItem();
                        }
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: controller.loadingMore.value
                          ? controller.news.length + 2
                          : controller.news.length,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
