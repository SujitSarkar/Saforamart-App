import 'package:flutter/material.dart';

class StarBuilder extends StatelessWidget {
  final double rating;
  final double starSize;
  final Color starColor;
  const StarBuilder({Key? key, required this.rating,required this.starColor,required this.starSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (rating <= 1) {
      return Icon(Icons.star, color: starColor, size: starSize);
    }
    else if (rating >1 && rating<2) {
      return Row(
        children: [
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star_half, color: starColor, size: starSize)
        ],
      );
    }
    else if (rating == 2) {
      return Row(
        children: [
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize)
        ],
      );
    }
    else if (rating >2 && rating<3) {
      return Row(
        children: [
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star_half, color: starColor, size: starSize)
        ],
      );
    }
    else if (rating == 3) {
      return Row(
        children: [
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize)
        ],
      );
    }
    else if (rating >3 && rating<4) {
      return Row(
        children: [
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star_half, color: starColor, size: starSize)
        ],
      );
    }
    else if (rating == 4) {
      return Row(
        children: [
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
        ],
      );
    }
    else if (rating >4 && rating<5) {
      return Row(
        children: [
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star_half, color: starColor, size: starSize)
        ],
      );
    }
    else if (rating == 5) {
      return Row(
        children: [
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize),
          Icon(Icons.star, color: starColor, size: starSize)
        ],
      );
    } else {
      return Container();
    }
  }
}
