//lib
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';
//widget
import 'package:ui_teach_news/component/appbar.dart';
//const
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
                ? Stack(
                    children: [
                      Container(
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
                      ),
                      Positioned(
                        top: 15,
                        bottom: 15,
                        right: 16,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              picPost = null;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.08,
                            height: 230,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                              ),
                              color: Colors.black54,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
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

  Future<void> addNewPost() async {
    if (picPost == null) {
      setState(() {
        const snack = SnackBar(content: Text('.لطفا یک تصویر انتخاب کنید'));
        ScaffoldMessenger.of(context).showSnackBar(snack);
        return;
      });
    }

    if (controller.text.isEmpty) {
      const snack = SnackBar(content: Text(".متن خود را وارد کنید"));
      ScaffoldMessenger.of(context).showSnackBar(snack);
      return;
    }

    final content = controller.text.trim();
/*
 final newData = {
  "title": null,
  "content": content,
  "command": null,
  "image": picPost!.path,
};


final newPost = Post(
  success: true,
  statusCode: 201,
  msg: "new article stored",
  data: newData, // از مپ خالی برای data استفاده کنید.
);



    try {
      final createdPost = await createPost(newPost);
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
      final snack = SnackBar(content: Text('خطا در ایجاد پست: $e'));
      ScaffoldMessenger.of(context).showSnackBar(snack);
    }*/
  }
}
