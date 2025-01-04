import 'package:authentication_user/authService/authService.dart';
import 'package:authentication_user/pages/forgotPassword.dart';
import 'package:authentication_user/pages/registerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();


}
class _LoginPageState extends State<LoginPage>{
  final AuthService authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

//login button presses
  void login()async {
    //prepare data
    final email = _emailController.text;
    final password = _passwordController.text;
    //attempt login
    try{
      await authService.signInWithEmailPassword(email, password);

//error
    }catch(e){
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error $e")));
      }

    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              label: Text("Email"),
              hintText: "Enter Email", 
              hintStyle: TextStyle(color: Colors.grey),

            ),
          ),
          TextField(
            controller: _passwordController,
              decoration: const InputDecoration(
                  label: Text("Password"),
                  hintText: "Enter Password",
                  hintStyle: TextStyle(color: Colors.grey)
              ),
            obscureText: true,
          ),
          const SizedBox(
            height: 11,
          ),
          ElevatedButton(onPressed: login, child: const Text("Login")),
          const SizedBox(height: 11,),
          GestureDetector(
            onTap: ()=>Navigator.push(context,
            MaterialPageRoute(builder: (context)=> ForgotPasswordPage())),
              child: Text("forgot Password")),
          SizedBox(height: 11,),

          GestureDetector(
            onTap: ()=>Navigator.push(context,
                    ( MaterialPageRoute(builder: (context)=> const RegisterPage()))),
              child: const Text("Don't have an account? SignUp"))

        ],
      ),
    );
  }

}