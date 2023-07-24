import 'package:quiz1/Services/networking.dart';

import '../Model/random_image_model.dart';

class FetchData {
  Future<RndomImage> getRandonImage() async {
    RndomImage randomImage = await NetworkHelper(
            'https://random.imagecdn.app/v1/image?width=1080&height=1920&category=dark&format=json')
        .getData();
    return randomImage;
  }
}
