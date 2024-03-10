import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class ApiServices {

  Future<dynamic> uploadImage (Uint8List bytes, String filename) async{
    var request = http.MultipartRequest('POST', Uri.parse("https://api.escuelajs.co/api/v1/files/upload"));

    var multipartFiles = http.MultipartFile(
      "file",
      http.ByteStream.fromBytes(bytes),
      bytes.length,
      filename: filename,
    );

    request.files.add(multipartFiles);
    StreamedResponse response = await request.send();

    if(response.statusCode == 201){
      var data = await response.stream.bytesToString();
      return jsonDecode(data);
    }else {
      return null;
    }
  }

}