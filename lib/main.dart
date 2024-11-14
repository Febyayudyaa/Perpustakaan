import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://aomhzrovhlriunptdmvc.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFvbWh6cm92aGxyaXVucHRkbXZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE1NTM4NTEsImV4cCI6MjA0NzEyOTg1MX0.vwjbFG3aH3HUyHpBwirNGZ1c5rgoeMrgxa0RPJ2V_XE');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Digital Library',
      home: BookListPage(),
      debugShowCheckedModeBanner: false,
    ); 
  }
}