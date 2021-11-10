// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';


class GenerateScreen extends StatefulWidget {
  const GenerateScreen({Key? key}) : super(key: key);

  @override
  _GenerateScreenState createState() => _GenerateScreenState();
}

class _GenerateScreenState extends State<GenerateScreen> {
  final TextEditingController _controller = TextEditingController();

   File? _image;

  final imagePicker = ImagePicker();

 

  getImageFromGallery()async{
   final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

   setState(() {
     if(pickedImage != null){
       _image = File(pickedImage.path);
       print(_image);
     }else{
       print('no image selected');
     }
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                QrImage(
                  data: _controller.text,
                  size: 200,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 30,
                  ),
                  child: textField(),
                ),
               
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: SfBarcodeGenerator(
                     
                     value: _controller.text,
                     symbology: Code128(),
                     showValue: true,
                   ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField textField() {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Enter some text',
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          icon: const Icon(Icons.done),
          onPressed: () => setState(() {}),
        ),
      ),
    );
  }
}
