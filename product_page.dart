import 'package:flutter/material.dart';
import 'hot_offers.dart';
import 'product_card.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // To show a Snackbar when adding a product to the cart
  void _showAddToCartSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Item added to the cart!"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Kinglook'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Our Products', style: TextStyle(fontSize: 24)),
            ),
            Container(
              height: 200,
              child: PageView(
                children: [
                  Image.asset('assets/shirt1.jpg', fit: BoxFit.cover),
                  Image.asset('assets/shirt2.jpg', fit: BoxFit.cover),
                  Image.asset('assets/shirt3.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            // "Hot Offers" Section with ListView
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Hot Offers', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            HotOffers(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Products', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two cards per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: width / 2 / 250,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return ProductCard(onAddToCart: _showAddToCartSnackbar);
              },
            ),
          ],
        ),
      ),
    );
  }
}