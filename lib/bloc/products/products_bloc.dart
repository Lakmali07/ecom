
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecom/models/product_list.dart';
import 'package:ecom/services/product_repository.dart';
import 'package:meta/meta.dart';


part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  ProductsBloc() : super(ProductsInitial()) {
    on<FetchProducts>(_getProducts);
  }

  void _getProducts(FetchProducts event, Emitter<ProductsState> emmit)async{
    final ProductRepository repository = ProductRepository();
    emit(ProductsLoading());
    try{
      final response = await repository.getProducts();
      ProductList list = ProductList.fromJson(json.decode(response.body));
      emit(ProductsSuccess(list.data!.products ?? []));
    }catch(e){
      emit(ProductsFailure(e.toString()));
    }
  }
}
