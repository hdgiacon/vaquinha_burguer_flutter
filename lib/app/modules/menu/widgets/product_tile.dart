import 'package:flutter/material.dart';
import 'package:vaquinha_burguer/app/core/ui/formatter_helper.dart';
import 'package:vaquinha_burguer/app/core/ui/vakinha_ui.dart';
import 'package:vaquinha_burguer/app/models/product_model.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {

  final ProductModel product;

  const ProductTile({ 
    Key? key,
    required this.product
  }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        height: 80.0,
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'http://dartweek.academiadoflutter.com.br/images${product.image}'
                  ),
                  fit: BoxFit.cover                  
                )
              )
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: VakinhaUi.textBold,
                    ),
                    Text(
                      FormatterHelper.formatCurrency(product.price)
                    )
                  ],
                ),
              )
            )
          ]
        )
      ),
      onTap: (){
        Get.toNamed('/product_detail', arguments: product);
      }
    );
  }
}