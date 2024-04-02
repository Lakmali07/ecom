import 'package:ecom/models/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCell extends StatelessWidget {
  final Products product;
  const ProductCell({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                child: Image.network('https://recipes.net/wp-content/uploads/2021/01/why-eat-real-food.jpg')),
    ]
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 65,
                    child: Text(product.shortDescription ?? '',style: TextStyle(fontSize: 16),)),
                SizedBox(height: 10,),
                Text('Rs ${product.price != null ? product.price!.toStringAsFixed(2) : ''}',style: TextStyle(fontSize: 12,color: Colors.grey),),
                SizedBox(height: 10,),
                Text('Rs ${product.discountPrice != null ? product.discountPrice!.toStringAsFixed(2) : ''}',style: TextStyle(fontSize: 12),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
