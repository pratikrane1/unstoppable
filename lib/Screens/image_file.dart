import 'dart:io';
import 'package:flutter/material.dart';
class ImageFile{
  String? id;
  String? imagePath;
  String? imageFileName;
  String? price;
  File? image;
  ImageFile({this.id,this.image,this.imagePath,this.imageFileName,
    this.price});//added on 2/12/2020

}