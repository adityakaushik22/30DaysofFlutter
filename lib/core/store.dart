import 'package:first_app/models/cart.dart';
import 'package:first_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  // constructor
  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog =
        catalog; // cart.catalog matlab .catalog setter function and we set the value to the catalog that we initialised from catalogmodel catalog;
  }
}
