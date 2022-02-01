import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vakinha_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF140E0E),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover
                )
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: context.heightTransformer(reducedBy: 85.0)
                  ),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 60.0
                  ),
                  VakinhaButton(
                    label: 'ACESSAR', 
                    width: context.widthTransformer(reducedBy: 40.0),
                    height: 35.0,
                    onPressed: (){
                      Get.toNamed('/auth/login');
                    }
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}