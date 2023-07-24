// To parse this JSON data, do
//
//     final rndomImage = rndomImageFromJson(jsonString);

import 'dart:convert';

RndomImage rndomImageFromJson(String str) =>
    RndomImage.fromJson(json.decode(str));

String rndomImageToJson(RndomImage data) => json.encode(data.toJson());

class RndomImage {
  String provider;
  String license;
  String terms;
  String url;
  Size size;

  RndomImage({
    required this.provider,
    required this.license,
    required this.terms,
    required this.url,
    required this.size,
  });

  factory RndomImage.fromJson(Map<String, dynamic> json) => RndomImage(
        provider: json["provider"],
        license: json["license"],
        terms: json["terms"],
        url: json["url"],
        size: Size.fromJson(json["size"]),
      );

  Map<String, dynamic> toJson() => {
        "provider": provider,
        "license": license,
        "terms": terms,
        "url": url,
        "size": size.toJson(),
      };
}

class Size {
  String height;
  String width;

  Size({
    required this.height,
    required this.width,
  });

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
      };
}
