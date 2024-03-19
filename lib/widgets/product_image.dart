

  import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Padding productImage(String image, Size size) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: size.width / 3,
          // height: size.height / 4,
          child: CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => const LinearProgressIndicator(
              color: Colors.grey,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      );