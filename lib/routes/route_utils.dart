
import 'package:ecom/views/cart_view.dart';
import 'package:ecom/views/home_view.dart';
import 'package:ecom/views/messages_view.dart';
import 'package:ecom/views/profile_view.dart';

final appRoutes = {
  homeRoute: (_) => HomeView(),
  messageRoute: (_) => MessagesView(),
  profileRoute: (_) => ProfileView(),
  cartRoute: (_) => CartView(),
};

const String homeRoute = "/";
const String messageRoute = "/messageView";
const String profileRoute = "/profileView";
const String cartRoute = "/cartView";