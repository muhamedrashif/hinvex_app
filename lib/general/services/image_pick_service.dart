import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ImageService {
  ImageService(this._storage);

  final FirebaseStorage _storage;
  final ImagePicker picker = ImagePicker();
  FutureResult<File> getGalleryImage() async {
    final XFile? pickedImageFile;
    final File? imageFile;
    // String url;
    try {
      pickedImageFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImageFile != null) {
        imageFile = File(pickedImageFile.path);
        // url = saveImage(imageFile: imageFile).toString();
        return right(imageFile);
      } else {
        return left(
            const MainFailure.imagePickFailed(errorMsg: 'Image is not picked'));
      }
    } catch (e) {
      return left(
          const MainFailure.imagePickFailed(errorMsg: 'Image is not picked'));
    }
  }

//save image

  Future<Either<MainFailure, String>> saveImage({
    required File imageFile,
  }) async {
    final String imageName =
        'userProfile/${DateTime.now().microsecondsSinceEpoch}.png';
    final String? downloadUrl;
    try {
      await _storage
          .ref(imageName)
          .putFile(imageFile, SettableMetadata(contentType: 'image/png'));
      downloadUrl = await _storage.ref(imageName).getDownloadURL();

      return right(downloadUrl);
    } catch (e) {
      return left(const MainFailure.imageUploadFailure(
          errorMsg: 'Image is not picked'));
    }
  }

//delete Image

//  Future<Either<MainFailure, void >> deleteUrl({
//     required String? imageUrl,
//   }) async {
//     if (imageUrl == null) return right(none());
//     final imageRef = _storage.refFromURL(imageUrl);
//     try {
//       await imageRef.delete();

//     } catch (e) {
//       onFailure.call(BText.imageDeleteError);
//     }
//   }
}
