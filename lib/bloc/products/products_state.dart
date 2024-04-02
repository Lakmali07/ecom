part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsSuccess extends ProductsState{
  final List<Products> productslList;

  ProductsSuccess(this.productslList);
}

class ProductsFailure extends ProductsState{
  final String error;

  ProductsFailure(this.error);
}

class ProductsLoading extends ProductsState{

}