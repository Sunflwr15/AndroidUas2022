import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../component/book2.dart';
import '../../component/searchbar.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/search_controller.dart';

class SearchView extends StatelessWidget {
  TextEditingController search = TextEditingController();
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: searchBar(context, search)),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    Obx(
                      () => Center(
                        child: Wrap(
                          runSpacing: MediaQuery.of(context).size.width * 0.045,
                          spacing: MediaQuery.of(context).size.width * 0.045,
                          children:
                              List.generate(controller.book.length, (index) {
                            return bookOther(
                                context,
                                controller.book[index].img,
                                controller.book[index]);
                          }),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

Widget header(
    BuildContext context, String user, TextEditingController controller) {
  return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
          height: MediaQuery.of(context).size.width * 1,
          width: MediaQuery.of(context).size.width * 1,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Home",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            searchBar(context, controller)
          ])));
}
