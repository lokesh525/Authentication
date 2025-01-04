import 'package:authentication_user/pages/loginPage.dart';
import 'package:authentication_user/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget{
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          //loading
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Scaffold(
              body: CircularProgressIndicator(),
            );
          }
          final session = snapshot.hasData? snapshot.data!.session:null;
          if(session !=null){
            return const ProfilePage();
          } else{
            return const LoginPage();
          }
        },);

  }

}