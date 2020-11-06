import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/globlal_controller.dart';
import 'package:getx_demo/models/product.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      id: 'products',
      builder: (_) => ListView.builder(
        itemBuilder: (__, index) {
          final Product product = _.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("USD ${product.price}"),
            trailing: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: product.isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  _.onFavorite(index, !product.isFavorite);
                }),
          );
        },
        itemCount: _.products.length,
      ),
    );
  }
}
