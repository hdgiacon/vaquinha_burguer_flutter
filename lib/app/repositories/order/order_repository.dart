import 'package:vaquinha_burguer/app/models/order.dart';
import 'package:vaquinha_burguer/app/models/order_pix.dart';

abstract class OrderRepository {
  Future<OrderPix> createOrder(Order order);
}