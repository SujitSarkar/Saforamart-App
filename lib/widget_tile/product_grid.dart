import 'package:flutter/material.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class ProductGrid extends StatelessWidget {
  final String img;
  final String title;
  final double price;
  final double discount;
  final double? discountPrice = 0;

  const ProductGrid(
      {Key? key,
      required this.img,
      required this.title,
      required this.price,
      required this.discount,
      discountPrice = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 120,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(img), fit: BoxFit.contain)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          color: ThemeAndColor.secondaryColor.withOpacity(.8),
                          child: Text(
                            discount.toStringAsFixed(2),
                            style: TextStyle(color: ThemeAndColor.whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                title,
                overflow: TextOverflow.fade,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    discountPrice == 0 ? "" : "\$${price.toStringAsFixed(2)}",
                    style:
                        const TextStyle(decoration: TextDecoration.lineThrough),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
