import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_finder_task/app/helpers/enums.dart';
import 'package:news_finder_task/app/models/news.dart';
import 'package:news_finder_task/app/services/news.dart';

class NewsScreenController extends GetxController {
  final service = Get.put(NewsServices());
  final loading = false.obs;
  final news = <NewsModel>[].obs;
  final selectedCategory = Rx<CategoriesEnum?>(null);

  Future<void> getNews() async {
    try {
      loading.value = true;
      news.assignAll(
        await service.getNews(
          category: selectedCategory.value == CategoriesEnum.all ? null : selectedCategory.value,
        ),
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      Get.snackbar(e.toString(), '');
    } finally {
      loading.value = false;
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
      (callback) => getNews(),
    );
    super.onReady();
  }
}
