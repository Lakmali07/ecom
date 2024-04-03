import 'package:ecom/models/product_list.dart';
import 'package:flutter/material.dart';

class ProductCell extends StatelessWidget {
  final Products product;
  const ProductCell({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 12),
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    child: Image.network('https://cdn.mos.cms.futurecdn.net/Ekc54rx2YMgRt5ycD5KYf5.jpg')),
              ),
              Positioned(
                  top: 10,
                  left: 0,
                  child: Container(
                    width: 50,
                    height: 24,
                    color: Colors.black,
                    child:Center(child: Text('${product.discount.toString()} %',style: const TextStyle(color: Colors.grey),)),
                  )),
              Positioned(
                right: 10,
                  bottom: 0,
                  child: Container(
                    width: 50,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star,color: Colors.red,size: 15,),
                        Text((product.rate ?? ''),style: const TextStyle(color: Colors.red),),
                      ],
                    ),
              )),
    ]
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 65,
                    child: Text(product.shortDescription ?? '',style: const TextStyle(fontSize: 16),)),
                const SizedBox(height: 10,),
                Text('Rs ${product.price != null ? product.price!.toStringAsFixed(2) : ''}',style: const TextStyle(fontSize: 12,color: Colors.grey),),
                const SizedBox(height: 10,),
                Text('Rs ${product.discountPrice != null ? product.discountPrice!.toStringAsFixed(2) : ''}',style: const TextStyle(fontSize: 12),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
