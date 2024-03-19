import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/route_manager.dart';
import 'package:tezda_app/controllers/db_controller.dart';
import 'package:tezda_app/pages/product_details_page.dart';
import 'package:tezda_app/widgets/product_image.dart';
import '../modules/product.dart';

Padding productWidget(Product product, Size size) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Get.to(() => ProductDetails(product)),
        child: Column(
          children: [
            Row(
              children: [
                productImage(product.image, size),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: size.height / (size.width < 600 ? 4 : 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            child: Text(
                          product.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Row(
                          children: [
                            Text(
                              '${product.price} \$',
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                       
                          ],
                        ),
                        Text("Catagory: ${product.category}"),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: product.rate ?? 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                             Row(
                         
                               children: [
                                 IconButton(
                                     onPressed: () {},
                                     icon: const Icon(
                                       Icons.share,
                                       color: Colors.indigo,
                                     )),
                                 IconButton(
                                     onPressed: () {},
                                     icon: const Icon(
                                       Icons.shopping_bag,
                                     )),
                                 IconButton(
                                     onPressed: () async => await DBProvider.db
                                         .toggleLike(product),
                                     icon: Icon(
                                       Icons.favorite,
                                       color: product.isLiked == 'true'
                                           ? Colors.pink
                                           : null,
                                     )),
                               ],
                             )
                         
                     
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                    width: size.width - 30,
                    child: Text(
                      product.description,
                      overflow: TextOverflow.ellipsis,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
