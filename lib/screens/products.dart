import 'package:ateam_machine_test/widgets/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/product_list_item.dart';
import '../models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: Consumer<ProductsProvider>(
        builder: (_, value, child) {
          if (value.status == ProductsStatus.error) {
            return const Center(
              child: Text('Error loading products'),
            );
          }
          if (value.status == ProductsStatus.success) {
            return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: value.products!.length,
              itemBuilder: (ctx, index) {
                final product = value.products![index];
                return InkWell(
                  onTap: () {
                    _showProductDetail(product);
                  },
                  child: ProductListItem(product: product),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  _showProductDetail(Product product) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => ProductDetail(product: product),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
    );
  }
}
