import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  Products({Key key}) : super(key: key);

  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {"name": "Camera", "image": "assets/products/camera1.jpg", "price": "10"},
    {
      "name": "Home",
      "image": "assets/products/homeappliance1.jpg",
      "price": "50"
    },
    {"name": "Sun Glass", "image": "assets/products/glass1.jpg", "price": "8"},
    {
      "name": "Men's Fashion",
      "image": "assets/products/man1.jpg",
      "price": "10"
    },
    {
      "name": "Necklace",
      "image": "assets/products/jewellery1.jpg",
      "price": "16"
    },
    {"name": "Mobile", "image": "assets/products/mobile1.jpg", "price": "40"},
    {"name": "Shoe", "image": "assets/products/shoe1.jpg", "price": "28"},
    {"name": "Camera", "image": "assets/products/camera1.jpg", "price": "10"},
    {
      "name": "Home",
      "image": "assets/products/homeappliance1.jpg",
      "price": "50"
    },
    {"name": "Sun Glass", "image": "assets/products/glass1.jpg", "price": "8"},
    {
      "name": "Men's Fashion",
      "image": "assets/products/man1.jpg",
      "price": "10"
    },
    {
      "name": "Necklace",
      "image": "assets/products/jewellery1.jpg",
      "price": "16"
    },
    {"name": "Mobile", "image": "assets/products/mobile1.jpg", "price": "40"},
    {"name": "Shoe", "image": "assets/products/shoe1.jpg", "price": "28"}
  ];



  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery
                .of(context)
                .size
                .height / 1),
      ),
      itemBuilder: (BuildContext context, int index) {
        return SingleProduct(
          prodName: productList[index]['name'],
          prodPrice: productList[index]['price'],
          prodImage: productList[index]['image'],
        );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final prodName;
  final prodImage;
  final prodPrice;
  final snackBar = SnackBar(
    content: Text('Notification Sent!!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  SingleProduct({this.prodName, this.prodImage, this.prodPrice});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 10.0, bottom: 8.0),
      child: Card(
        elevation: 6.0,
        color: Colors.cyanAccent,
        child: Hero(
          tag: prodName,
          child: Material(
            child: InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.contain, // otherwise the logo will be tiny
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(prodImage, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        prodName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$prodPrice",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text('Seller Notified !!'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );

                        // Find the Scaffold in the widget tree and use
                        // it to show a SnackBar.
                        Scaffold.of(context).showSnackBar(snackBar);
                      }, child: Text("Interested"),
                    )
                  ],

                )
//          child: GridTile(
//            footer: Container(
//              color: Colors.white70,
//              child: ListTile(
//                leading: Text(prodName, style:TextStyle(fontWeight: FontWeight.bold),
//                ),
//                title: Text("\$$prodPrice", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
//                ),
//              ),
//            ),
//
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Image.asset(prodImage, fit:BoxFit.cover),
//            ),
//          ),
            ),
          ),
        ),
      ),

    );
  }
}