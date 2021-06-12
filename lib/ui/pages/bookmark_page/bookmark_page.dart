import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/bookmark_controller.dart';
import 'components/app_bar.dart';
import 'components/body.dart';

class BookmarkPage extends GetView<BookmarkController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
