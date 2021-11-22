import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safora_mart/controller/public_controller.dart';
import 'package:safora_mart/static_variavles/app_tabs.dart';
import 'package:safora_mart/static_variavles/theme_and_color.dart';

class HomeGridView extends StatefulWidget {
  const HomeGridView({Key? key}) : super(key: key);

  @override
  State<HomeGridView> createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView>
    with SingleTickerProviderStateMixin {
  // late final ScrollController _scrollController;

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    // _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final PublicController publicController = Get.find();
    return IgnorePointer(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: (1 / .5),
        shrinkWrap: true,
        children: List.generate(6, (index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: AppTabs(text: publicController.tabs[index]),
          );
        }),
      ),
      // child: GridView.builder(
      //     padding: const EdgeInsets.all(10),
      //     itemCount: 6,
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //       childAspectRatio: 3 / 2,
      //       crossAxisSpacing: 10,
      //       mainAxisSpacing: 10,
      //     ),
      //     itemBuilder: (context, index) {
      //       return Container(
      //         height: publicController.size.value * 0.2,
      //         width: publicController.size.value * 0.2,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //         child: GridTile(
      //           child: GestureDetector(
      //             onTap: () {},
      //             child: Image.network(
      //               'http://saforamart.glamworlditltd.com/admin/slide_show/1636200543174357pexels-photo-1656666.jpeg',
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //           footer: GridTileBar(
      //             backgroundColor: Colors.black87,
      //             leading: IconButton(
      //               icon: Icon(
      //                 Icons.favorite,
      //                 color: Theme.of(context).colorScheme.secondary,
      //               ),
      //               onPressed: () {},
      //             ),
      //             title: const Text(
      //               "productTitle",
      //               textAlign: TextAlign.center,
      //             ),
      //             // trailing: IconButton(
      //             //   icon: const Icon(
      //             //     Icons.shopping_cart,
      //             //   ),
      //             //   onPressed: () {},
      //             //   color: Theme.of(context).colorScheme.secondary,
      //             // ),
      //           ),
      //         ),
      //       );
      //     }),
    );
  }

  Widget gridView() {
    return IgnorePointer(
      child: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {},
                  child: Image.network(
                    'http://saforamart.glamworlditltd.com/admin/slide_show/1636200543174357pexels-photo-1656666.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.black87,
                  leading: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {},
                  ),
                  title: const Text(
                    "productTitle",
                    textAlign: TextAlign.center,
                  ),
                  // trailing: IconButton(
                  //   icon: const Icon(
                  //     Icons.shopping_cart,
                  //   ),
                  //   onPressed: () {},
                  //   color: Theme.of(context).colorScheme.secondary,
                  // ),
                ),
              ),
            );
          }),
    );
  }
}
