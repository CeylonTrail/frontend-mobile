import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController extends GetxController {
  final RxList<XFile> images = <XFile>[].obs;

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final List<XFile>? selectedImages = await picker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      images.addAll(selectedImages);
    }
  }

  void removeImage(int index) {
    images.removeAt(index);
  }
}
