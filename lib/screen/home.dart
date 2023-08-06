//lib
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
//model
import 'package:ui_teach_news/api_model/poster_model.dart';

import 'package:ui_teach_news/api_model/product_model.dart';
//widget
import 'package:ui_teach_news/widget/view_widget.dart';

//const
import 'package:ui_teach_news/constant/const.dart';
//page
import 'package:ui_teach_news/screen/view_post.dart';

import 'package:ui_teach_news/screen/create_post.dart';

import 'package:ui_teach_news/screen/all_post_view.dart';
//api
import 'package:ui_teach_news/service/api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<PosterModel> posterModel;
  late Future<Product?> topVisited;
  int listLength = 0;
  @override
  void initState() {
    posterModel = getHomeData();
    topVisited = fetchProduct();

    topVisited.then((value) {
      if (value != null) {
        setState(() {
          listLength = value.topVisited.length; // مقداردهی به متغیر listLength
        });
      }
    });

    super.initState();
  }

  late int index;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TechNews',
          style: Constant.textStyleAppBar,
        ),
        centerTitle: true,
        toolbarHeight: 63,
        leading: Image.asset('assets/icons/icon.png'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FutureBuilder(
          future: posterModel,
          builder: (BuildContext context, AsyncSnapshot<PosterModel> snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: large, vertical: large),
                  child: Column(
                    children: [
                      Container(
                        height: size.height / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(medium),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(snapshot.data!.image).image,
                          ),
                        ),
                      ),
                      const SizedBox(height: medium),
                      Text(
                        snapshot.data!.title ?? '',
                        textDirection: TextDirection.rtl,
                        style: Constant.textStyleHome,
                      ),
                      const SizedBox(height: large),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AllPostView(),
                                ),
                              );
                            },
                            child: const Text(
                              "مشاهده همه",
                              style: Constant.textStyleHomeLabalLeft,
                            ),
                          ),
                          Text(
                            "جدید ترین مطالب ($listLength)",
                            style: Constant.textStyleHomeLabalRight,
                          ),
                        ],
                      ),
                      const SizedBox(height: large),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: SizedBox(
                          height: size.height * 0.4,
                          child: FutureBuilder(
                            future: topVisited,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasData &&
                                  snapshot.data != null) {
                                Product blogModel = snapshot.data!;

                                return CarouselSlider(
                                  items: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ViewPost(
                                              index:
                                                  0, // یا هر شماره‌ای که برای آیتم اول قرار دهید
                                              image:
                                                  blogModel.topVisited[0].image,
                                              title:
                                                  blogModel.topVisited[0].title,
                                              contant: blogModel
                                                  .topVisited[0].content
                                                  .toString(),
                                              view: blogModel.topVisited[0].view
                                                  .toString(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(small),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: size.width * 0.7,
                                                  height: 217,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            medium),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                              blogModel
                                                                  .topVisited[0]
                                                                  .image)
                                                          .image,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 2,
                                                  right: 2,
                                                  child: ViewWidget(
                                                      item: blogModel
                                                          .topVisited[0]),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              blogModel.topVisited[0].title,
                                              style: Constant
                                                  .textStyleListViewText,
                                            ),
                                            const Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "نویسنده : ساسان صفری",
                                                style: Constant
                                                    .textStyleListViewCaptionText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                  options: CarouselOptions(
                                    autoPlay: false,
                                    enlargeCenterPage: false,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    viewportFraction: 0.85,
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              } else {
                                return const Text("");
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.dotsTriangle(
                      color: titleColor,
                      size: 80,
                    ),
                    const SizedBox(
                      height: large,
                    ),
                    const Text(
                      "لطفا صبر کنید...",
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: SizedBox(
        height: 86,
        width: 86,
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: titleColor.withOpacity(0.8),
          highlightElevation: 86,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewPost(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            size: 52,
          ),
        ),
      ),
    );
  }
}
