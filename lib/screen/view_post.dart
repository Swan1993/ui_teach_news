import 'package:flutter/material.dart';
import 'package:ui_teach_news/component/appbar.dart';
import 'package:ui_teach_news/constant/const.dart';

class ViewPost extends StatelessWidget {
  const ViewPost({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Component.appBarViewPost(context),
        body: SizedBox(
          child: Column(
            children: [
              Image.asset(
                "assets/image/elon-musk.png",
                fit: BoxFit.fitWidth,
                width: double.infinity,
                height: 272,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 22, horizontal: 15),
                child: Text(
                  "ایلان ماسک مدعی شده که می‌تواند در صورت لزوم تراشه نورالینک را...",
                  style: Constant.textStyleViewPostTitle,
                  textDirection: TextDirection.rtl,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 22, right: 15, left: 15),
                child: Text(
                  """لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.""",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ));
  }
}
