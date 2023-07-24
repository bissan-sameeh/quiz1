import 'package:http/http.dart' as http;

import '../Model/random_image_model.dart';

class NetworkHelper {
  String url;

  NetworkHelper(this.url);
  Future<RndomImage> getData() async {
    http.Response response = await http
        .get(Uri.parse(url)); /*connect with api and get the response*/
    if (response.statusCode == 200) {
      // print(response);
      /*if there is response*/
      RndomImage randomImage = rndomImageFromJson(response
          .body); /*convert string body (response) to Type  RndomImage Model*/
      return randomImage;
    }
    return Future.error("Somthing wrong");
  }
}
