import 'dart:developer';

import 'package:vaquinha_burguer/app/core/rest_client/rest_client.dart';
import 'package:vaquinha_burguer/app/models/order_pix.dart';

import 'package:vaquinha_burguer/app/models/order.dart';

import './order_repository.dart';

class OderRepositoryImpl implements OrderRepository{

  final RestClient _restClient;

  OderRepositoryImpl({required RestClient restClient})
    : _restClient = restClient;

  @override
  Future<OrderPix> createOrder(Order order) async {
    final result = await _restClient.post('/order/', {
      'userId': order.userId,
      'cpf': order.cpf,
      'adress': order.adress,
      'items': order.items.map((shoppingCard) => {
        'quantity': shoppingCard.quantity,
        'productId': shoppingCard.product.id
      }).toList()
    });

    if(result.hasError){
      log(
        'Erro ao realizar pedido ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current
      );
      throw RestClientException('Erro ao realizar pedido');
    }

    return OrderPix.fromMap(result.body);
  }

}