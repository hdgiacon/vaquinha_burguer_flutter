import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/core/ui/vakinha_ui.dart';
import 'package:vaquinha_burguer/app/modules/routes/auth_routers.dart';
import 'package:vaquinha_burguer/app/modules/routes/splash_routers.dart';

void main() {
  runApp(const VakinhaBurguerMainApp());
}

class VakinhaBurguerMainApp extends StatelessWidget {
  const VakinhaBurguerMainApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Vakinha Burguer",
      debugShowCheckedModeBanner: false,
      theme: VakinhaUi.theme,
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers
      ]
    );
  }
}