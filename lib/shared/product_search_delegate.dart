import 'package:flutter/material.dart';
import 'package:mobile_flutter/arguments/detail_product_view_argument.dart';
import 'package:mobile_flutter/models/product_model.dart';
import 'package:mobile_flutter/shared/cached_image.dart';
import 'package:mobile_flutter/views/dashboard/product/product_provider.dart';
import 'package:provider/provider.dart';

class ProductSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isNotEmpty) {
            query = '';
          } else {
            close(context, null);
          }
        },
        icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_outlined)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ProductModel> products = Provider.of<ProductProvider>(context, listen: false).products;
    List<ProductModel> suggestions = products.where((element) {
      final result = element.name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return suggestions.isEmpty
    ? const Center(child: Text('Produk tidak tersedia'))
    : ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final ProductModel product = suggestions[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context, 
                '/detail_product',
                ModalRoute.withName('/dashboard'),
                arguments: DetailProductViewArgument(product: product)
              );
              FocusScope.of(context).requestFocus(FocusNode());
            },
            leading: cachedImage(url: product.imgUrl, width: 100),
            title: Text(product.name),
          ),
        );
      },
    );
  }
}