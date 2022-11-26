import 'package:first_app/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            // isInCart = isInCart.toggle();
            // final _catalog = CatalogModel();
            AddMutation(catalog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Mythemes.darkBluish),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
