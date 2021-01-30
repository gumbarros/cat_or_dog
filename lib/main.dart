import 'package:cat_or_dog/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(GetMaterialApp(
    theme:  ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: HomeView()
  ));
}