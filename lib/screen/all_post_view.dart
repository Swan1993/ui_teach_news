//lib
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
//widget
import 'package:ui_teach_news/component/appbar.dart';
//const
import 'package:ui_teach_news/constant/const.dart';

import 'package:ui_teach_news/widget/view_widget.dart';
//model
import 'package:ui_teach_news/api_model/product_model.dart';
//Api
import 'package:ui_teach_news/service/api.dart';

import 'view_post.dart';

class AllPostView extends StatefulWidget {
  const AllPostView({Key? key}) : super(key: key);

  @override
  State<AllPostView> createState() => _AllPostViewState();
}

class _AllPostViewState extends State<AllPostView> {
  late Future<Product?> topVisited;

  @override
  void initState() {
    topVisited = fetchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Component.appBarViewPost(context, 'همه مقالات'),
      body: FutureBuilder(
        future: topVisited,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
          } else if (snapshot.hasData) {
            Product blogModel = snapshot.data!;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: blogModel.topVisited.length,
              itemBuilder: (context, index) {
                final item = blogModel.topVisited[index];
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewPost(
                            contant: item.content.toString(),
                            index: index,
                            image: item.image,
                            title: item.title,
                            view: item.view,
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 19.0, bottom: 19.0, top: 23.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14.0),
                              child: Container(
                                height: 88,
                                width: 88,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.0),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(item.image).image),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 18.0, left: 19),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 201,
                                    child: Text(
                                      item.title,
                                      style: Constant.textStyleAllPageText,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "نویسنده : ساسان صفری",
                                        style: Constant
                                            .textStyleListViewCaptionText,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 50),
                                        child: ViewWidget(item: item),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Text("${snapshot.error}");
          }
        },
      ),
    );
  }
}
