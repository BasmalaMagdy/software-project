import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//single product class
class Single_Product extends StatelessWidget {
  final prod_name;
  final prod_pic;
  final prod_old_price;
  final prod_price;

  Single_Product(
      {this.prod_name, this.prod_pic, this.prod_old_price, this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$prod_price",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$$prod_old_price",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prod_pic,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}

//products.dart
class Products extends StatefulWidget {
  Products({Key key}) : super(key: key);
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazzer",
      "picture":
          "https://media.istockphoto.com/photos/blue-womens-insulated-jacket-in-white-background-invisible-mannequin-picture-id1092378606?k=6&m=1092378606&s=612x612&w=0&h=0SHkiVq5sxCojp1k9vEHxkHnrk4owzXUVQgPoBKCYH8=",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture":
          "https://image.shutterstock.com/image-vector/vector-illustration-isolated-plus-size-260nw-1368418490.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Red dress",
      "picture":
          "https://image.shutterstock.com/image-vector/vector-illustration-isolated-plus-size-260nw-1368418490.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Red dress",
      "picture":
          "https://media.istockphoto.com/photos/blue-womens-insulated-jacket-in-white-background-invisible-mannequin-picture-id1092378606?k=6&m=1092378606&s=612x612&w=0&h=0SHkiVq5sxCojp1k9vEHxkHnrk4owzXUVQgPoBKCYH8=",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Red dress",
      "picture":
          "https://media.istockphoto.com/photos/blue-womens-insulated-jacket-in-white-background-invisible-mannequin-picture-id1092378606?k=6&m=1092378606&s=612x612&w=0&h=0SHkiVq5sxCojp1k9vEHxkHnrk4owzXUVQgPoBKCYH8=",
      "old_price": 100,
      "price": 50,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_Product(
              prod_name: product_list[index]['name'],
              prod_pic: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price']);
        });
  }
}

// fixed search bar
class SearchField extends StatelessWidget {
  const SearchField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:10.0, left:70, right: 70),
      child: Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(30.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical:14),
          hintText: "Search...",
          suffixIcon: Icon(Icons.search,
                      color: Colors.grey,    
          ), //Icon
          border: InputBorder.none,
        ), //InputDecoration
      ),//TextField
        
    ), //Material
    ); //Container
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon cusIcon = Icon(Icons.search, color: Colors.white);
  Widget cusSearchBar = Text('Shop App');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: cusSearchBar,
        bottom: PreferredSize(
          preferredSize: Size(50, 50),
          child: Container(
            child: SearchField(),
             
//          color: Colors.orange,
//           height: 30.0,
              ), //Container
        ), //PreferredSize
        actions: <Widget>[
          
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {}),
        ],
      ), //AppBar
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[], //Widget
        ), //ListView
      ), //Drawer
      body: new ListView(
        children: <Widget>[
          //SearchField(),
          Container(
            height: 500.0,
            child: Products(),
          ), //Container
        ], //<Widget>[]
      ), //ListView
    ); // Scaffold
  }
}