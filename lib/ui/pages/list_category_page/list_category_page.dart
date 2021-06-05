import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/list_category_controller.dart';

import './components/body.dart';
import 'components/app_bar.dart';

class ListCategoryPage extends GetView<ListCategoryController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: Body(),
        ),
      ),
    );
  }
}
