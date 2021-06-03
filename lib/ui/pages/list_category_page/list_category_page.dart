import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/list_category_controller.dart';

class ListCategoryPage extends GetView<ListCategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListCategoryPage'),
      ),
      body: SafeArea(
        child: Text('ListCategoryController'),
      ),
    );
  }
}
