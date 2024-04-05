import 'package:ecom/bloc/products/products_bloc.dart';
import 'package:ecom/models/product_list.dart';
import 'package:ecom/widgets/product_cell.dart';
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
    return Column(
        children: [
          SizedBox(
            height: 310,
            child: Column(
              children: [
                Container(
                  margin:const EdgeInsets.only(top: 10,left: 5,right: 5,bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xfff0f0f0),
                    borderRadius:  BorderRadius.circular(10),
                  ),
                      child: const TextField(
                        decoration:InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          hintText: 'Search for items',
                        ),
                      ),
                ),
                Image.asset('assets/images/add.png'),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 460,
            color: Colors.grey[50],
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if(state is ProductsFailure){
                  return Center(
                    child: Text(state.error),
                  );
                }
                if(state is! ProductsSuccess){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final List<Products> productsList = state.productslList;
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                      childAspectRatio: 0.65,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      return ProductCell(product: productsList[index],);
                    });
              },
            ),
          ),
        ],
      );
  }
}
