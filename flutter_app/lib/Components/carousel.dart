import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app/common/constants.dart';

class CarouselImg extends StatefulWidget {
  @override
  _CarouselImgState createState() => _CarouselImgState();
}

class _CarouselImgState extends State<CarouselImg> {
  int currentPos = 0;
  List<String> imglist = ['images/s0.jpg', 'images/s1.jpg', 'images/s2.jpg', 'images/s3.jpg'];
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: AnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPos == index ? 20 : 6,
      decoration: BoxDecoration(
        //color: currentPos == index ? Colors.orange[900] : Colors.black,
        color: Colors.black,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imglist.length,
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
              pauseAutoPlayOnTouch: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPos = index;
                  });
                }
            ),
          itemBuilder:  (BuildContext context, int itemIndex) {
            return Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(imglist[itemIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'On sale',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Lorem Ipsum is simply dummy text use for printing and type script',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
            );
          }
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imglist.length,
                (index) => buildDot(index: index),
          ),
        ),
      ],
    );
  }
}


