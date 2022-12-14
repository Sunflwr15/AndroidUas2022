import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas2022/app/modules/component/button.dart';
import 'package:uas2022/app/modules/component/parts.dart';
import 'package:uas2022/app/modules/home/views/home_view.dart';

import '../../../data/model/BookModel.dart';
import '../../login/views/pages/banner.dart';
import '../controllers/detail_book_controller.dart';

class DetailBookView extends StatelessWidget {
  @override
  DetailBookController controller = Get.put(DetailBookController());
  var data = Get.arguments;
  // final Books data;
  // DetailBookView({required this.data});

  Widget build(BuildContext context) {
    print(data.title);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(color: Colors.black54),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.495,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (() {
                              Get.back(canPop: true);
                            }),
                            child: Icon(CupertinoIcons.back,
                                color: Colors.white, size: 35),
                          ),
                          Obx(() => InkWell(
                                onTap: (() {
                                  controller.onClick();
                                }),
                                child: controller.toggle.value
                                    ? Icon(CupertinoIcons.bookmark,
                                        color: Colors.white, size: 30)
                                    : Icon(CupertinoIcons.bookmark_fill,
                                        color: Colors.white, size: 30),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: NetworkImage(
                                data.img,
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )),
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      data.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Text(
                                    data.author,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  info(data.rating.toString(), "Rating"),
                                  info(data.reviews.toString(), "Reviews"),
                                ],
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sinopsis",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        button(
                          "Read Now",
                          "/book",
                          context,
                          Colors.white,
                          0.7,
                          13,
                        ),
                        buttonDownload(
                          Icons.download,
                          context,
                          0.2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget info(final data, String title) {
  return Padding(
    padding: const EdgeInsets.only(right: 15.0),
    child: Column(children: [
      Text(
        title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        textAlign: TextAlign.start,
      ),
      Text(
        data,
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
        textAlign: TextAlign.start,
      ),
    ]),
  );
}

Widget buttonDownload(IconData icon, BuildContext context, final width) {
  return Container(
    width: MediaQuery.of(context).size.width * width,
    height: MediaQuery.of(context).size.width * 0.15,
    decoration: BoxDecoration(
      color: Colors.black87,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 4,
          offset: Offset(0, 4), // changes position of shadow
        ),
      ],
    ),
    child: Center(
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    ),
  );
}
