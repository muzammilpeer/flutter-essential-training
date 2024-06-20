import 'dart:convert';
import 'dart:io';

import 'attachment_image_model.dart';
import 'package:http/http.dart' as http;

class AttachmentRepository {
  Future<List<PixelAttachmentImageModel>>
      getAttachmentImagesFromNetwork() async {
    try {
      // get attachment images from network
      var endpoint = Uri.parse("https://picsum.photos/v2/list");
      final response = await http.get(endpoint);
      if (response.statusCode == 200) {
        print("Response = ${response.body}");
        final List<dynamic> decodedList = jsonDecode(response.body) as List;
        final List<PixelAttachmentImageModel> attachmentImages =
            decodedList.map((item) {
          return PixelAttachmentImageModel.fromJson(item);
        }).toList();
        return attachmentImages;
      } else {
        throw Exception("API is not succesfull");
      }
    } on SocketException {
      throw Exception("No internet connection");
    } on HttpException {
      throw Exception("Failed to load attachment images");
    } on FormatException {
      throw Exception("Invalid response format");
    } catch (e) {
      throw Exception("unknown exception");
    }
  }
}
