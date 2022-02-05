
import 'package:vaquinha_burguer/app/models/shopping_card_model.dart';

class Order {
  int userId;
  String cpf;
  String adress;
  List<ShoppingCardModel> items;
  
  Order({
    required this.userId,
    required this.cpf,
    required this.adress,
    required this.items,
  });

}
