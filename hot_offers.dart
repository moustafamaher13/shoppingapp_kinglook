import 'package:flutter/material.dart';

class HotOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset('assets/shirt8.jpg', fit: BoxFit.cover),
                ),
                Text('Hot Offer ${index + 1}', style: TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}