import 'dart:ffi';

import 'package:first_app/core/store.dart';
import 'package:first_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // single ton class, so that this will not create new instances in new fils when we need the object of this class
  // static final cartModel = CartModel._internal();
  // CartModel._internal();
  // factory CartModel() => cartModel;
  // made these as comments because now they are not necessary as we use the vxstate

  //catalog field
  late CatalogModel _catalog;

  //collection of Ids - stores id of each item
  final List<int> _itemIds = [];

  // getter for catalogmodel since we have made the catalogmodel private so thats why we have to use getter to use in class
  CatalogModel get catalog => _catalog;

  // setter for catalogmoel
  set catalog(CatalogModel newcatalog) {
    _catalog = newcatalog;
  }

  // get items in the cart
  List<Item> get items => _itemIds.map((e) => _catalog.getById(e)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
