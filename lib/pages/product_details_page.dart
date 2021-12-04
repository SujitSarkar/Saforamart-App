import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:safora_mart/controller/cart_controller.dart';
import 'package:safora_mart/controller/product_controller.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/models/product.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';
import 'package:safora_mart/widget_tile/category_wise_product.dart';
import 'package:safora_mart/widget_tile/product_amount_inc.dart';
import 'package:safora_mart/widget_tile/star_builder.dart';

import '../nav_pages/cart_page.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with SingleTickerProviderStateMixin {
  final PublicController _publicController = Get.find();

  final ProductController _productController = Get.find();

  final CartController cartController = Get.find();

  get index => _productController.currentProductIndex;

  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabBarList.length, vsync: this);
  }

  List tabBarList = const [
    Text("Description"),
    Text("Customer Review"),
    Text("Question & Answer"),
  ];

  List tabBarViewList = [];

  List<String> productSizetitle = [
    "Small",
    "Medium",
    "Large",
  ];

  int productSizeIndex = 0;

  late Product _item;

  var isProductAddedToCart = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeAndColor.whiteColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ThemeAndColor.blackColor,
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          Center(
            //Cart Button And Functionality...
            child: InkWell(
              child: Stack(children: [
                Icon(
                  LineAwesomeIcons.shopping_cart_arrow_down,
                  color: Colors.grey.shade800,
                  size: _publicController.size.value * .085,
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.all(_publicController.size.value * .007),
                    decoration: const BoxDecoration(
                        color: ThemeAndColor.themeColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: GetBuilder<CartController>(
                      init: CartController(),
                      builder: (_) {
                        return Text(
                          cartController.itemCount.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: _publicController.size.value * .02,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        );
                      },
                    ),
                  ),
                )
              ]),
              onTap: () => Get.to(() => const CartPage()),
            ),
          ),
          //Wishlist button and functionality...
          GetBuilder<ProductController>(
            init: ProductController(),
            initState: (_) {
              _item = _productController.findProductById(widget.id);
            },
            builder: (_) {
              return IconButton(
                onPressed: () {
                  _productController.toggleFavouriteStatus(widget.id);
                  Fluttertoast.showToast(
                      msg: _item.isFavourite
                          ? "Added to Wishlist"
                          : "Remove from Wishlist",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1);
                },
                icon: _item.isFavourite
                    ? const Icon(Icons.favorite,
                        color: ThemeAndColor.secondaryColor)
                    : const Icon(Icons.favorite_outline_outlined,
                        color: Colors.black),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _publicController.size.value * .04),
          child: Column(
            children: [
              //Product image
              productImage(),
              //Rating and sold
              ratingRow(),
              //Product Name and Description
              productTitleRow(),
              SizedBox(
                height: _publicController.size.value * .05,
              ),

              SizedBox(
                height: _publicController.size.value * .05,
              ),
              //Product Size
              productSizeRow(context),
              SizedBox(
                height: _publicController.size.value * .05,
              ),
              //Product Price
              productPriceRow(),
              SizedBox(
                height: _publicController.size.value * 0.018,
              ),
              buyAndCartButtonRow(),
              SizedBox(
                height: _publicController.size.value * 0.06,
              ),
              orderByCallRow(context),
              SizedBox(
                height: _publicController.size.value * 0.06,
              ),
              tabBarSection(context),
              const Divider(
                thickness: 1.5,
              ),
              const CategoryWiseProduct(categoryTitle: "Related Products"),
              SizedBox(
                height: _publicController.size.value * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }

  Row orderByCallRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Order By Call:",
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: _publicController.size.value * 0.047,
              ),
        ),
        orderTypes(
            context: context,
            icon: Icons.phone,
            iconColor: ThemeAndColor.themeColor),
        orderTypes(
            context: context,
            icon: Icons.facebook,
            iconColor: ThemeAndColor.starColorList[4].withOpacity(0.8)),
        orderTypes(
            context: context,
            icon: LineAwesomeIcons.pinterest_p,
            iconColor: Colors.red),
        orderTypes(
            context: context,
            icon: LineAwesomeIcons.what_s_app,
            iconColor: ThemeAndColor.starColorList[3]),
      ],
    );
  }

  Container orderTypes({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: _publicController.size.value * 0.12,
      height: _publicController.size.value * 0.12,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: iconColor,
              size: _publicController.size.value * 0.06,
            )),
      ),
    );
  }

  Row buyAndCartButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: _publicController.size.value * 0.01),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ThemeAndColor.starColorList[1],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(LineAwesomeIcons.shopping_bag),
                  Text(
                    "BUY NOW",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: ThemeAndColor.whiteColor,
                        ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: _publicController.size.value * 0.01),
            child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(LineAwesomeIcons.shopping_bag),
                    Obx(() => Text(
                          isProductAddedToCart.value == true
                              ? "Remove from CART"
                              : "ADD TO CART",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: ThemeAndColor.whiteColor,
                                  fontSize: isProductAddedToCart.value == true
                                      ? _publicController.size.value * 0.03
                                      : _publicController.size.value * 0.033),
                        )),
                  ],
                ),
                onPressed: () {
                  isProductAddedToCart.toggle();
                  cartController.addItem(
                    _productController.items[index].id,
                    _productController.items[index].price,
                    _productController.items[index].productTitle,
                    1,
                    _productController.items[index].imageUrl,
                  );
                  print("Product added to Cart...");
                }),
          ),
        ),
      ],
    );
  }

  Column tabBarSection(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: _publicController.size.value * 0.12,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            controller: _tabController,
            labelColor: ThemeAndColor.blackColor,
            labelPadding: EdgeInsets.all(_publicController.size.value * 0.03),
            labelStyle: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: _publicController.size.value * 0.04),
            unselectedLabelColor: ThemeAndColor.blackColor.withOpacity(0.6),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            isScrollable: true,
            tabs: const [
              Text("Description"),
              Text("Customer Review"),
              Text("Question & Answer"),
            ],
          ),
        ),
        SizedBox(
          height: _publicController.size.value * 0.55,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
            controller: _tabController,
            children: [
              description(),
              customerReview(context),
              questionAnswer(context),
              // Text("Question & Answer"),
              // ...tabBarList
            ],
          ),
        ),
      ],
    );
  }

  Card productImage() => Card(
        child: Hero(
          tag: "productImage",
          child: Container(
            height: _publicController.size.value * 0.9,
            decoration: BoxDecoration(
              color: ThemeAndColor.whiteColor,
              image: const DecorationImage(
                  image: AssetImage("assets/images/dove-lotion.jpg")),
            ),
          ),
        ),
      );

  SizedBox ratingRow() => SizedBox(
        height: _publicController.size.value * 0.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Rating",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  width: _publicController.size.value * 0.015,
                ),
                StarBuilder(
                    rating: 3.9,
                    starColor: ThemeAndColor.starColorList[1],
                    starSize: _publicController.size.value * 0.05)
              ],
            ),
            const Text(
              "Not In Stock",
              style: TextStyle(
                color: ThemeAndColor.secondaryColor,
              ),
            ),
          ],
        ),
      );

  Text productTitleRow() {
    return Text(
      _productController.items[index].productTitle,
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Row productSizeRow(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(right: _publicController.size.value * 0.02),
            child: Text(
              "Size: ",
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 17),
            ),
          ),
          Wrap(
            children: List.generate(productSizetitle.length, (index) {
              return InkWell(
                  onTap: () => setState(() {
                        productSizeIndex = index;
                      }),
                  child: productSize(context, productSizetitle[index], index));
            }),
          )
        ],
      );

  Row productPriceRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Price: ",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: _publicController.size.value * .045),
              ),
              Text(
                "${_productController.items[index].price.toStringAsFixed(2)} \u{09F3}",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: _publicController.size.value * .05,
                      decoration: TextDecoration.underline,
                    ),
              )
            ],
          ),

          SizedBox(
            height: _publicController.size.value * .05,
          ),
          //Product price and amount
          ProductAmountInc(
            productId: _productController.items[index].id,
          ),
        ],
      );

  Widget productSize(BuildContext context, String text, int index) {
    return Container(
      width: _publicController.size.value * 0.18,
      padding: EdgeInsets.all(_publicController.size.value * .02),
      margin: EdgeInsets.only(right: _publicController.size.value * .02),
      decoration: BoxDecoration(
        color: productSizeIndex == index
            ? Theme.of(context).primaryColor
            : Theme.of(context).primaryColor.withOpacity(0.1),
        border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.2), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5!.copyWith(
            fontSize: _publicController.size.value * .03,
            color: productSizeIndex == index
                ? ThemeAndColor.whiteColor
                : Colors.black54),
      ),
    );
  }

  SizedBox description() => SizedBox(
        height: _publicController.size.value * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(_publicController.size.value * 0.02),
              child: const Text(
                "Detail:",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _publicController.size.value * 0.05),
              child: Text(_productController.items[index].description),
            )
          ],
        ),
      );

  Column questionAnswer(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: _publicController.size.value * 0.4,
          child: commonTextField(
              context: context,
              hintText: "Write Your Question Here...",
              buttonText: "SUBMIT QUESTION",
              buttonPress: _productController.qaButtonPress),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text("View All QnA"),
        )
      ],
    );
  }

  Column customerReview(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: _publicController.size.value * 0.4,
          child: commonTextField(
              context: context,
              hintText: "Write Your Review Here...",
              buttonText: "SUBMIT REVIEW",
              buttonPress: _productController.reviewButtonPress),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text("View All Reviews"),
        )
      ],
    );
  }

  Padding commonTextField(
          {required BuildContext context,
          required String hintText,
          required String buttonText,
          required Function buttonPress}) =>
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _publicController.size.value * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _productController.reviewController,
              maxLines: 3,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 0.9,
                    ),
                  ),
                  hintText: hintText),
            ),
            ElevatedButton(onPressed: buttonPress(), child: Text(buttonText))
          ],
        ),
      );
}
