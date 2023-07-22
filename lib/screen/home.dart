import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ui_teach_news/api_model/blog_model.dart';
import 'package:ui_teach_news/api_model/poster_model.dart';
import 'package:ui_teach_news/constant/const.dart';
import 'package:ui_teach_news/screen/view_post.dart';
import 'package:ui_teach_news/service/api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<PosterModel> posterModel;
  late List<BlogModel> topVisited = [];
  @override
  void initState() {
    posterModel = getHomeData();
    loadTopVisited();

    super.initState();
  }

  Future<void> loadTopVisited() async {
    try {
      List<BlogModel> blogModel = await getTopVisited();
      setState(() {
        topVisited = blogModel;
      });
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load server. Status code');
    }
  }

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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "مشاهده همه",
                            style: Constant.textStyleHomeLabalLeft,
                          ),
                          Text(
                            "جدید ترین مطالب",
                            style: Constant.textStyleHomeLabalRight,
                          ),
                        ],
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: SizedBox(
                          height: size.height * 0.4,
                          child: ListView.builder(
                            itemCount: topVisited.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final date = topVisited[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ViewPost()));
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
                                                  BorderRadius.circular(medium),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    Image.network(date.image!)
                                                        .image,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 2,
                                            right: 2,
                                            child: Container(
                                              width: 84,
                                              height: 33,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        large),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Icon(
                                                    Icons.visibility,
                                                    color: titleColor,
                                                  ),
                                                  Text(
                                                    date.view.toString(),
                                                    style: Constant
                                                        .textStyleHomeLabalRight,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        date.title ?? '',
                                        style: Constant.textStyleListViewText,
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
                              );
                            },
                          ),
                        ),
                      )
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
                child: Center(
                  child: LoadingAnimationWidget.dotsTriangle(
                    color: titleColor,
                    size: 80,
                  ),
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
          onPressed: () {},
          child: const Icon(
            Icons.add,
            size: 52,
          ),
        ),
      ),
    );
  }
}
