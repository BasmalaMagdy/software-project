import 'package:flutter/material.dart';

List<BoxShadow> ShadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

class HorizontalList extends StatelessWidget {
  var Categories = [
    {
      "caption": "shirt",
      "pic": 'images/cats/tshirt.png',
    },
    {
      "caption": "Accessories",
      "pic": 'images/cats/accessories.png',
    },
    {
      "caption": "Dress",
      "pic": 'images/cats/dress.png',
    },
    {
      "caption": "Formal",
      "pic": 'images/cats/formal.png',
    },
    {
      "caption": "Informal",
      "pic": 'images/cats/informal.png',
    },
    {
      "caption": "Jeans",
      "pic": 'images/cats/jeans.png',
    },
    {
      "caption": "Shoes",
      "pic": 'images/cats/shoe.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: ShadowList,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      Categories[index]['pic'],
                      height: 60,
                      width: 60,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    Categories[index]['caption'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
        /*children: [
          Category(
            image_location: 'images/cats/tshirt.png',
            image_caption: 'Shirt',
          ),
          Category(
            image_location: 'images/cats/accessories.png',
            image_caption: 'Accessories',
          ),
          Category(
            image_location: 'images/cats/dress.png',
            image_caption: 'Dress',
          ),
          Category(
            image_location: 'images/cats/formal.png',
            image_caption: 'Formal',
          ),
          Category(
            image_location: 'images/cats/informal.png',
            image_caption: 'Informal',
          ),
          Category(
            image_location: 'images/cats/jeans.png',
            image_caption: 'Jeans',
          ),
          Category(
            image_location: 'images/cats/shoe.png',
            image_caption: 'Shoes',
          ),
        ],*/
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                image_caption,
                style: new TextStyle(fontSize: 10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
