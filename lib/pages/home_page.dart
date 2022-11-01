import 'dart:convert';

import 'package:first_app/models/catalog.dart';
import 'package:first_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/item_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
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
    int day = 1;
    // final dummylist = List.generate(50, (index) => CatalogModel.products[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            (CatalogModel.products != null && CatalogModel.products.isNotEmpty)
                ? ListView.builder(
                    itemCount: CatalogModel.products.length,
                    itemBuilder: ((context, index) {
                      return ItemWidget(
                        item: CatalogModel.products[index],
                      );
                    }))
                : Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
      drawer: Mydrawer(),
    );
  }
}
