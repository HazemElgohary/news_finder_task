import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/news_details_controller.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewsDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NewsDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
