
import 'package:authentication_user/authService/authGate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  await Supabase.initialize(
      url: 'https://dhjduwidnqwvsgtuzjvw.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRoamR1d2lkbnF3dnNndHV6anZ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU3ODg2NTksImV4cCI6MjA1MTM2NDY1OX0.qRao1cjGReb-uSeLrUV_YkzWrhp6rHQBhUH-XgOXxcY');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthGate(),
    );
  }
}


