import 'package:authentication_user/authService/authService.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState()=> _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage>{
  final authService = AuthService();
  void logout()async{
    await authService.signOut();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Container(

        ),
      )
    );
  }

}