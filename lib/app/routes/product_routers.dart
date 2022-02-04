
import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/modules/product_detail/product_detail_page.dart';
import 'package:vaquinha_burguer/app/modules/product_detail/product_detail_bindings.dart';

class ProductRouters {
  ProductRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/product_detail',
      binding: ProductDetailBindings(),
      page: () => const ProductDetailPage()
    )
  ];
}