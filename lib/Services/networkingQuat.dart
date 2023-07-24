import 'package:http/http.dart' as http;

import '../Model/quate_random.dart';
import '../Model/random_image_model.dart';

class NetworkHelperQutes {
  String url;

  NetworkHelperQutes(this.url);
  Future<QuateRandomModel> getDataQuats() async {
    try {
      http.Response response = await http.get(Uri.parse(url));

/*connect with api and get the response*/
      if (response.statusCode == 200) {
        /*if there is response*/
        QuateRandomModel randomQuate = quateRandomFromJson(response
            .body); /*convert string body (response) to Type  Quate Model*/
        return randomQuate;
      }
      return Future.error("Somthing wrong");
    } catch (e) {
      return Future.error(e);
    }
  }
}
