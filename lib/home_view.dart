import 'package:cat_or_dog/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller)=>Scaffold(
          appBar: AppBar(title: Text("Cat or Dog ?"),centerTitle: true, elevation: 5,),
          body: Container(
            width: Get.width,
            child: Visibility(
              visible: !controller.isLoading,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  controller.file != null ? Image.file(controller.file) : Text("Please upload a image.", style: TextStyle(fontSize: 25.0),),
                  SizedBox(height: Get.height / 20),
                  Text(controller.animal == null ? "" : controller.animal.toString(), style: TextStyle(fontSize: 25.0),)
                ],
              ),
              replacement: Center(child: CircularProgressIndicator(),),
            ),
          ),
          floatingActionButton: FloatingActionButton(child: Icon(Icons.image_rounded),onPressed: controller.chooseImage,),
        )
    );
  }
}
