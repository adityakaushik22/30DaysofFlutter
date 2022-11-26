import 'dart:convert';
import 'dart:io';
import 'package:first_app/core/store.dart';
import 'package:first_app/models/cart.dart';
import 'package:first_app/models/catalog.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/drawer.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/item_widget.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final response = await http.get(Uri.parse(url));
    // var catalogjson = response.body;

    var catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogjson);
    var productsData = decodedData["products"];
    // print(productsData); it will only give the data inside the products in the json file i.e the values in the map.

    CatalogModel.products =
        List.from(productsData).map<Item>((e) => Item.fromMap(e)).toList();
    setState(() {}); // to update the changes on screen
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummylist = List.generate(50, (index) => CatalogModel.products[0]);
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: ((context, store, status) => FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
              // backgroundColor: Theme.of(context).backgroundColor,
              child: Icon(CupertinoIcons.cart),
            ).badge(
                color: Vx.red400,
                size: 22,
                count: _cart.items.length,
                textStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold))),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      // backgroundColor: context.canvasColor,, if velocity package is used,

      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.products != null &&
                  CatalogModel.products.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}
