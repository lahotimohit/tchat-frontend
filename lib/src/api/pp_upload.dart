import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:image_picker/image_picker.dart';
import 'package:tchat_frontend/generated_api/profile_pic_upload/tchat_pp_storage.swagger.dart';
import 'package:tchat_frontend/src/providers/storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:tchat_frontend/src/widgets/snackmessage.dart';

Future<bool> uploadProfilePicture(BuildContext context, XFile image) async {
  SecureStorage storage = SecureStorage();
  try {
    String accessToken ="";
    await dotenv.load(fileName: '.env');
    await storage.readData("accessToken").then((value) {
        accessToken = value;
      });
    final authToken = "Bearer $accessToken";
    Map<String, MediaType> mimeTypes = {
      '.jpg': MediaType("image", "jpeg"),
      '.jpeg': MediaType("image", "jpeg"),
      '.png': MediaType("image", "png"),
    };
    String fileExtension = p.extension(image.path).toLowerCase();
    MediaType contentType = mimeTypes[fileExtension] ?? MediaType("image", "jpeg");

    var multipartFile =  await http.MultipartFile.fromPath(
      'file',
      image.path,
      filename: image.name.isNotEmpty ? image.name : 'profile_picture$fileExtension',
      contentType: contentType,
    );
    final apiClient = TchatPpStorage.create(
      baseUrl: Uri.parse(dotenv.env['PP_SERVER_URL']!),
    );
    final response = await apiClient.profilePictureUploadPost(
      authorization: authToken,
      file: multipartFile,
    );
    if (response.isSuccessful) {
      storage.writeSecureData("pp_fileName", response.body!.fileName!);
      context.mounted ? snackmessage(context, "Profile Picture Uploaded Successfully") : null;
      return true;
    } else {
      context.mounted ? snackmessage(context, "Upload Failed ${response.error}") : null;
      return false;
    }
  } 
  on SocketException {
    context.mounted ? snackmessage(context, "No Internet Connection") : null;
    return false;
  }
  catch (e) {
    context.mounted ? snackmessage(context, "Error in Uploading image: $e") : null;
    return false;
  }
}