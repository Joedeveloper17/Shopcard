
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopcard/CartProvider.dart';
import 'package:shopcard/items.dart';

import 'model.dart';

final cart = Provider.of<CartProvider>(context as BuildContext);
void saveData(int index) {
 
 var dbHelper;
 dbHelper
     .insert(
   Cart(
     id: index,
     productId: index.toString(),
     productName: products[index].name,
     initialPrice: products[index].price,
     productPrice: products[index].price,
     quantity: ValueNotifier(1),
     unitTag: products[index].unit,
     image: products[index].image,
   ),
 )
     .then((value) {
   cart.addTotalPrice(products[index].price.toDouble());
   cart.addCounter();
   print('Product Added to cart');
 }).onError((error, stackTrace) {
   print(error.toString());
 });
}