import 'package:first_app/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import '../../models/catalog.dart';
import 'catalog_header.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.products.length,
      itemBuilder: ((context, index) {
        final catalog = CatalogModel.products[index];
        return InkWell(
            onTap: (() => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog)))),
            child: CatalogItem(catalog: catalog));
      }),
    );
  }
}
