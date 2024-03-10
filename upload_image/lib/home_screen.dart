import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upload_image/api_services.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String uploadedImage = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text("Upload Image", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            uploadedImage == ""?const SizedBox():
                Container(
                  height: 200, width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(uploadedImage)
                    )
                  ),
                ),
            ElevatedButton(
              onPressed: ()async{
                final ImagePicker picker = ImagePicker();
            // Pick an image.
                final XFile? image = await picker.pickImage(source: ImageSource.gallery);

                if(image != null){
                  Uint8List bytes = await image.readAsBytes();
                  ApiServices().uploadImage(bytes, image.name).then((value) => {
                    //print(value.toString());
                    setState(() {
                      uploadedImage = value["location"].toString();
                    })
                  }).onError((error, stackTrace) => {
                    print(error.toString())
                  });
                }else{
                  print("no image");
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white
               ),
              child: const Text("upload image"),
            ),
          ],
        ),
      ),
    );
  }
}
