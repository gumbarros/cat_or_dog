import 'dart:io';
import 'package:cat_or_dog/animal.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomeController extends GetxController{
  bool isLoading = true;
  File file;
  Animal animal;


  @override
  Future<void> onReady() async{
    super.onReady();
    await loadModel().then((_){
      isLoading = false;
      update();
    });
  }

  Future<void> chooseImage() async {
    this.file = await ImagePicker.pickImage(source: ImageSource.gallery);
    isLoading = true;
    if (this.file != null) classifyImage();
  }

  Future<void> classifyImage() async{
     List output = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print(output);
    this.animal = output[0]['label'].contains("Cat") ? Animal.CAT : Animal.DOG;
    isLoading = false;
    update();
  }

  Future<void> loadModel() async{
    await Tflite.loadModel(model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  @override
  Future<void> dispose() async{
    await Tflite.close();
    super.dispose();
  }
}