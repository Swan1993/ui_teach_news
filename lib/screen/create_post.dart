import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_teach_news/api_model/post_model.dart';
import 'package:ui_teach_news/component/appbar.dart';
import 'package:ui_teach_news/constant/const.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  File? picPost;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Component.appBarNewPost(context),
      body: Column(
        children: [
          InkWell(
            onTap: () => reciveMyImage(mySource: ImageSource.gallery),
            child: picPost != null
                ? Container(
                    alignment: Alignment.center,
                    height: 278,
                    width: double.maxFinite,
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradiantPost,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(picPost!),
                      ),
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    height: 117,
                    width: double.maxFinite,
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradiantPost,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      "برای انتخاب تصویر ضربه بزنید",
                      style: Constant.textStyleNewPostPicBox,
                    ),
                  ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.all(15.0),
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                gradient: LinearGradient(
                  colors: gradiantPost,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: TextField(
                controller: controller,
                maxLines: 17,
                textDirection: TextDirection.rtl,
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintStyle: Constant.textStyleNewPostHitStyle,
                  hintText: "متن پست را اینجا بنویسید...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width * 0.90,
              height: 53,
              color: titleColor,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(width: 0)),
              onPressed: () => addNewPost(),
              child: const Text(
                "ذخیره پست جدید",
                style: Constant.textStyleNewPostBottom,
              ),
            ),
          )
        ],
      ),
    );
  }

  void reciveMyImage({required ImageSource mySource}) async {
    final myFile = await ImagePicker().pickImage(source: mySource);

    if (myFile?.path != null) {
      setState(() {
        picPost = File(myFile!.path);
      });
    }
  }

  void addNewPost() {
    if (picPost == null) {
      setState(() {
        const snack = SnackBar(content: Text('لطفا یک تصویر انتخاب کنید'));

        ScaffoldMessenger.of(context).showSnackBar(snack);
        return;
      });
    }

    if (controller.text.isEmpty) {
      const snack = SnackBar(content: Text("متن خود را وارد کنید"));

      ScaffoldMessenger.of(context).showSnackBar(snack);
      return;
    }

    final content = controller.text.trim();

    final newPost = PostModel(
      title: "",
      content: content,
      command: "",
      image: picPost!.path,
    );
  }
}
