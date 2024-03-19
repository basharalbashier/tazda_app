import 'package:flutter/material.dart';
import '../modules/product.dart';
import '../widgets/product_image.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails(this.product, {Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductState();
}

class _ProductState extends State<ProductDetails> {
  Product? product;
  @override
  void initState() {
    product = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (product == null) {
      return const CircularProgressIndicator();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            productImage(product!.image, size),
        
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product!.title,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.start,
              ),
            ),
        
        
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(product!.rate.toString()),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                //  Text('('+product!.count.toString()+')'),
              ],
            ),
        
            const SizedBox(
              height: 20,
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: '10%',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.pink),
                // style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  const TextSpan(
                      text: '  List Price:  ',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  TextSpan(
                      text: 'USD ${(5 * product!.price / 100) + product!.price}',
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      )),
                ],
              ),
            ),
        
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                // ignore: unnecessary_string_interpolations
                text: "${product!.price}  USD",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey),
                // style: DefaultTextStyle.of(context).style,
              ),
            ),
        
         
            // Text('All prices include VAT.'),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(
                text: "FREE delivery:",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
                children: <TextSpan>[
                  TextSpan(
                      text: "  on your first order",
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Gurenteed for: ',
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                children: <TextSpan>[
                  TextSpan(
                      text: '  1 year',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade900,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (() {}),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // const Icon(IcoFontIcons.locationArrow),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Select delivery location',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.teal)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 48,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.orangeAccent.shade100,
                          padding: const EdgeInsets.all(2.0),
                          textStyle:
                              const TextStyle(fontSize: 10, color: Colors.white),
                          backgroundColor: Colors.pink,
                          // shape:OutlinedBorder().
                        ),
                        // color: Colors.orange,
                        // height: 50,
                        child: const Center(
                            child: Text('Buy Now',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                      ),
                    ))
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 48,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.orangeAccent.shade100,
                          padding: const EdgeInsets.all(2.0),
                          textStyle: const TextStyle(fontSize: 10),
                          backgroundColor: Colors.amber,
                          // shape:OutlinedBorder().
                        ),
                        // color: Colors.orange,
                        // height: 50,
                        child: Center(
                            child: Text('Add to Cart',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey.shade900))),
                      ),
                    ))
                  ],
                )),
        
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: '	Description: \n',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.teal),
                  // style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: product!.description,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade900)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
