import 'package:flutter/material.dart';
import 'package:ui_teach_news/constant/const.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
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
        leading: Image.asset('assets/image/icon.png'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: large, vertical: large),
            child: Column(
              children: [
                Container(
                  height: size.height / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(medium),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/Main Card BG.png"),
                    ),
                  ),
                ),
                const SizedBox(height: medium),
                const Text(
                  "اطلاعات جدیدی از بازی Assassin's Creed Mirage فاش شد",
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
                SizedBox(
                  height: size.height / 2.8,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(small),
                        child: Container(
                          height: double.infinity,
                          width: 250,
                          color: Colors.pink,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
