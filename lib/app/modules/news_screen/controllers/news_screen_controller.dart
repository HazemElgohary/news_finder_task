import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_finder_task/app/helpers/enums.dart';
import 'package:news_finder_task/app/models/news.dart';
import 'package:news_finder_task/app/services/news.dart';

class NewsScreenController extends GetxController {
  final scrollController = ScrollController();
  final service = Get.put(NewsServices());
  final loading = false.obs;
  final news = <NewsModel>[].obs;
  final selectedCategory = Rx<CategoriesEnum>(CategoriesEnum.all);
  final loadingMore = false.obs;
  final canLoadingMore = false.obs;
  final page = 1.obs;

  Future<void> getNews() async {
    try {
      if (page.value == 1) {
        loading.value = true;
        news.clear();
      } else {
        loadingMore.value = true;
      }

      final newList = await service.getNews(
        page: page.value,
        category: selectedCategory.value == CategoriesEnum.all
            ? null
            : selectedCategory.value,
      );
      if (newList.isNotEmpty) {
        canLoadingMore.value = true;
        news.addAll(newList);
      } else {
        canLoadingMore.value = false;
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      Get.snackbar(e.toString(), '');
    } finally {
      loading.value = false;
      loadingMore.value = false;
    }
  }

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  @override
  void onReady() {
    ever(
      selectedCategory,
      (callback) {
        page.value = 1;
        getNews();
      },
    );
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent &&
            canLoadingMore.value) {
          page.value++;
          getNews();
        }
      },
    );

    super.onReady();
  }
}
