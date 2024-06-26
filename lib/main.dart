import 'package:ecom/bloc/login/login_bloc.dart';
import 'package:ecom/bloc/products/products_bloc.dart';
import 'package:ecom/services/api.dart';
import 'package:ecom/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/profile/profile_bloc.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DioApi(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(context.read<DioApi>()),
          ),
          BlocProvider<ProductsBloc>(
            create: (BuildContext context) => ProductsBloc(),
          ),
          BlocProvider<ProfileBloc>(
            create: (BuildContext context) => ProfileBloc(context.read<DioApi>()),
          ),
        ],
        child: MaterialApp(
          title: 'E com',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginView(),
        ),
      ),
    );
  }
}
