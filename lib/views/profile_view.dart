import 'package:ecom/bloc/profile/profile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if(state is ProfileFailure){
              return Center(
                child: Text(state.error),
              );
            }
            if(state is! ProfileSuccess){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(state.profile.avatar??'',width: 150,height: 150,),
                  Text(state.profile.name ??'',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text(state.profile.role ??'',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                ],
              ),
            );
          },
        ),
        Container(
          decoration: BoxDecoration(
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
          margin:EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height - 450,
          child: ListView(
            children: [
              ProfileTile(
                title: 'My Address Book',
                icon: Icons.library_books_outlined,
                buttonColor: Colors.blueAccent,
              ),
              ProfileTile(
                title: 'My Wallet',
                icon: Icons.attach_money,
                buttonColor: Colors.pinkAccent,
              ),
              ProfileTile(
                title: 'Edit My Profile',
                icon: Icons.manage_accounts_outlined,
                buttonColor: Colors.yellowAccent,
              ),
              ProfileTile(
                title: 'Change My Password',
                icon: Icons.key_outlined,
                buttonColor: Colors.green,
              ),
              ProfileTile(
                title: 'Logout',
                icon: Icons.call_outlined,
                buttonColor: Colors.purple,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color buttonColor;
  const ProfileTile({
    super.key, required this.title, required this.icon, required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:Container(
            decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: buttonColor,
            ),
              width:30,
              height: 30,
              child: Icon(icon,color: Colors.white,size: 20,)) ,
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),),
        Divider(height: 1,color: Colors.grey[300],),
      ],
    );
  }
}
