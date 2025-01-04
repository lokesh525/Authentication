import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

 class AuthService{
  final SupabaseClient _supabase = Supabase.instance.client;

  //Sign in with email and password
   Future<AuthResponse> signInWithEmailPassword(String email,String pasword)async{
    return await _supabase.auth.signInWithPassword(
        email: email,
        password: pasword);
  }
  //Sign up with email and password

  Future<AuthResponse> signUpWithEmailPassword(String email,String password)async{
    return await _supabase.auth.signUp(
        email: email,
        password: password);
  }
  //Sign Out
  Future<void>signOut()async{
    await _supabase.auth.signOut();
  }
  Future<void> forgotPasswordResetLink(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
      print("Password reset link sent to email: $email");
    } catch (e) {
      print("Error sending reset link: $e");
      rethrow;
    }
  }
  //Get users email
  String? getCurrentUserEmail(){
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }

}