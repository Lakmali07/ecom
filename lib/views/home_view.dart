import 'package:ecom/bloc/products/products_bloc.dart';
import 'package:ecom/models/product_list.dart';
import 'package:ecom/widgets/product_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if(state is ProductsFailure){
            return Center(
              child: Text(state.error),
            );
          }
          if(state is! ProductsSuccess){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<Products> productsList = state.productslList;
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 8.0, // spacing between rows
                crossAxisSpacing: 8.0, // spacing between columns
                childAspectRatio: 0.6,
              ),
              padding: EdgeInsets.all(8.0),
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return ProductCell(product: productsList[index],);
              });
        },
      ),
    );
  }
}
