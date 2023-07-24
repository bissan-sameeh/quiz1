import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/quate_random.dart';
import '../Model/random_image_model.dart';
import '../Services/fetch_data.dart';
import '../Services/fetch_data_quate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? imageUrl;
  String? randomContent;
  bool isLoaded = false;

  void geImage() async {
    RndomImage randomImage = await FetchData().getRandonImage();
    imageUrl = randomImage.url;
    setState(() {
      isLoaded = true;
    });
  }

  void getRandomContent() async {
    QuateRandomModel randomQuate = await FetchDataQuats().getRandonQuts();
    randomContent = randomQuate.content;
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    geImage();
    getRandomContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.7,
                image: NetworkImage(imageUrl ??
                    "https://mediaaws.almasryalyoum.com/news/large/2015/09/28/371231_0.JPG"),
                fit: BoxFit.fill)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (isLoaded == true) {
                        geImage();
                        getRandomContent();
                      } else {
                        const CircularProgressIndicator();
                      }
                      setState(() {
                        isLoaded = false;
                      });
                    },
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.green,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    randomContent ?? "data",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                children: [
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40)),
                    child: const Text("ScreenShot",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ]));
  }
}
