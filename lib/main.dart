import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Login_page.dart'; // Assurez-vous que LoginPage est dans ce fichier

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Supabase
  await Supabase.initialize(
    url: 'https://ugemmkjgrsffbirojosi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVnZW1ta2pncnNmZmJpcm9qb3NpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM3NDc2NTgsImV4cCI6MjA0OTMyMzY1OH0.NLhHRQR5RiWWNZrrf009HpGufbbH6WfLD8ClK0UuJAY',
  );

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),  // Correction : utilisation de 'home:' avec 'LoginPage()'
    );
  }
}

