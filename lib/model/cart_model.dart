import 'package:flutter/material.dart';
import 'package:prostore/model/api.dart';

class CartModel extends ChangeNotifier{
 //list of products on sale
 final List _shopProducts= data;

 //list of cart product
 List _cartProducts=[];
//  List _searchedProducts=[];

 get shopProducts => _shopProducts;
 get cartProducts => _cartProducts;
//  get searchedProducts => _searchedProducts;
 //add to cart
 void addProductsToCart(int index){
  _cartProducts.add(_shopProducts[index]);
  notifyListeners();
 }
 //remove from cart
 void removeProductFromCart(int index){
  _cartProducts.removeAt(index);
  notifyListeners();
 }
 //add total
 String calculateTotal(){
  double total=0;
  for (int i = 0; i < _cartProducts.length; i++) {
    total+=double.parse(_cartProducts[i][1]);
  }
  return total.toStringAsFixed(2);
 }


 
}