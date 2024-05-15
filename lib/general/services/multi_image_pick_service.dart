import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hinvex_app/general/failures/exeception/execeptions.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:image_picker/image_picker.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final ImagePicker picker = ImagePicker();
// DELETE IMAGE FROM STORAGE

Future<void> deleteUrl({
  required String url,
}) async {
  log(url);
  final imageRef = _storage.refFromURL(url);
  try {
    await imageRef.delete();
  } catch (e) {
    log(e.toString());
  }
}

// Future<List<File>> getMultipleImages(int maxImages) async {
//   try {
//     List<XFile>? pickedImageFiles = await picker.pickMultiImage();

//     if (pickedImageFiles.isNotEmpty && pickedImageFiles.length <= maxImages) {
//       if (pickedImageFiles.length > maxImages) {
//         throw MainFailure.imagePickFailed(
//             errorMsg: 'Cannot pick more than $maxImages images');
//       }

//       List<File> imageFiles = pickedImageFiles.map((XFile file) {
//         return File(file.path);
//       }).toList();

//       return imageFiles;
//     } else {
//       throw const MainFailure.imagePickFailed(
//           errorMsg: 'Images are not picked');
//     }
//   } catch (e) {
//     throw const MainFailure.imagePickFailed(
//         errorMsg: 'Images are not picked');
//   }
// }

FutureResult<List<String>> pickMultipleImages({required int maxImages}) async {
  final ImagePicker imagePicker = ImagePicker();
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final List<XFile>? pickedImageFiles = await imagePicker.pickMultiImage();
  final List<File> imageBytesList = [];
  List<String> url = [];
  if (pickedImageFiles != null && pickedImageFiles.length <= maxImages) {
    final List<Future<File>> futures = pickedImageFiles
        .take(maxImages)
        .map((pickedImageFile) => pickedImageFile
            .readAsBytes()
            .then((value) => File.fromRawPath(value)))
        .toList();

    final List<File> bytesList = await Future.wait(futures);

    for (final bytes in bytesList) {
      // final File imageBytes = File.fromList(bytes);
      imageBytesList.add(bytes);
    }
    url = await saveImages(imageFiles: imageBytesList);
  } else {
    return left(
        const MainFailure.imagePickFailed(errorMsg: 'Failed to pick images'));
  }

  return right(url);
}

// save images
Future<List<String>> saveImages({
  required List<File> imageFiles,
}) async {
  final List<String> downloadUrls = [];

  for (File imagePath in imageFiles) {
    final String imageName =
        'userUploadedProperty/${DateTime.now().microsecondsSinceEpoch}.png';
    try {
      await _storage
          .ref(imageName)
          .putFile(imagePath, SettableMetadata(contentType: 'image/png'));
      final downloadUrl = await _storage.ref(imageName).getDownloadURL();
      downloadUrls.add(downloadUrl);
    } on FirebaseException catch (e) {
      throw CustomExeception(e.code);
    }
  }

  return downloadUrls;
}
// Future<Either<MainFailure, List<String>>> saveIsmages({
//   required List<File> imageFiles,
// }) async {
//   List<String> downloadUrls = [];

//   try {
//     for (File imageFile in imageFiles) {
//       final String imageName =
//           'userUploadedProperty/${DateTime.now().microsecondsSinceEpoch}.png';

//       await _storage
//           .ref(imageName)
//           .putFile(imageFile, SettableMetadata(contentType: 'image/png'));

//       String downloadUrl = await _storage.ref(imageName).getDownloadURL();
//       downloadUrls.add(downloadUrl);
//     }

//     return right(downloadUrls);
//   } catch (e) {
//     return left(const MainFailure.imageUploadFailure(
//         errorMsg: 'Images upload failed'));
//   }
// }