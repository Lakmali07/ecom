import 'package:dio/dio.dart';
import 'package:ecom/bloc/login_bloc.dart';
import 'package:ecom/constants/constants.dart';
import 'package:ecom/services/api.dart';
import 'package:ecom/views/tab_view.dart';
import 'package:ecom/widgets/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //late DioApi _api;
  String _errorMsg = '';

  @override
  void initState() {
    super.initState();
   // _api = DioApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 150,left: 20,right: 20),
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          child: BlocConsumer<LoginBloc, LoginState>(
    listener: (context, state) {
      if (state is LoginFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)));
      } else if (state is LoginSuccess) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>
                TabView()), (Route<dynamic> route) => false);
      }
    },
  builder: (context, state) {
    if (state is LoginLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView(
            children: [
              Image.asset('assets/images/guitar_play.png',height: 200,width: 100,),
              Center(child: const Text('Welcome',style: TextStyle(fontSize: 30),)),
              FormTextField(
                  controller: _usernameController,
                  inputType: 'none',
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: 'Email',
                  isRequired: true),
              FormTextField(
                  controller: _passwordController,
                  inputType: 'none',
                  prefixIcon: const Icon(Icons.lock_open_outlined),
                  labelText: 'Password',
                  isRequired: true),
              SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                      onPressed: ()async{
                        context.read<LoginBloc>().add(LoginRequested(
                            email: _usernameController.text,
                            password: _passwordController.text));
                        // bool success = await _api.signIn(_usernameController.text,_passwordController.text);
                        // if(success) {
                        //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        //       TabView()), (Route<dynamic> route) => false);
                        // }else{
                        //   setState(() {
                        //     _errorMsg = 'Invalid Credentials';
                        //   });
                        // }
                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.themeYellow,
                          minimumSize: Size(400, 60),),
                      child: Text('Login')),
              ),
              Text(_errorMsg,style: TextStyle(color: Colors.red,fontSize: 16),)
            ],
          );
  },
),
        ),
      ),
    );
  }
}
