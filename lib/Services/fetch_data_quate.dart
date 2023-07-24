import 'package:quiz1/Services/networking.dart';

import '../Model/quate_random.dart';
import '../Model/random_image_model.dart';
import 'networkingQuat.dart';

class FetchDataQuats {
  Future<QuateRandomModel> getRandonQuts() async {
    QuateRandomModel randomImage =
        await NetworkHelperQutes("https://api.quotable.io/random")
            .getDataQuats();
    return randomImage;
  }
}
