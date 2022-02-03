import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vaquinha_burguer/app/modules/menu/widgets/product_tile.dart';
import './menu_controller.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RefreshIndicator(
        child: ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (BuildContext context, int index) {
            final prod = controller.menu[index];
            return ProductTile(product: prod);
          }
        ),
        onRefresh: controller.refreshPage,
      );
    });
  }
}
