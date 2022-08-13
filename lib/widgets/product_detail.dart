import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ratingCount = product.rating?.count;
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: CachedNetworkImage(
              height: 200,
              imageUrl: product.image ?? 'https://via.placeholder.com/150',
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            '${product.title}',
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 5.0),
          Text(
            '₹${product.price}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5.0),
          Text('Category: ${product.category}'),
          const SizedBox(height: 5.0),
          Row(
            children: [
              RatingBarIndicator(
                rating: product.rating?.rate ?? 0,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20.0,
              ),
              const SizedBox(width: 10.0),
              Text(
                "${ratingCount ?? 0} Rating${ratingCount == 1 ? '' : 's'}",
                style: const TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
