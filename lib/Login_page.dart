import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart'; // Assurez-vous que ce package est bien importé
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); // Constructeur

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Déclarez deux contrôleurs pour l'email et le mot de p

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Définir la durée de chargement
  Duration get loadingTime =>
      const Duration(milliseconds: 9000); // Correction de la syntaxe

  // Fonction pour l'authentification de l'utilisateur
  // Fonction d'authentification
  Future<String?> _authUser(LoginData data) async {
    print("Email: ${data.name}, Mot de passe: ${data.password}");

    // Mettez à jour les contrôleurs avec les valeurs retournées
    emailController.text = data.name; // Email
    passwordController.text = data.password; // Mot de passe
    final name = data.name;
    print("Email: $name");
    try {
      final response = await Supabase.instance.client.from('users').insert([
        {'name': name},
      ]).select(); // Utilisation de .select() pour récupérer les données insérées

      print('Réponse d\'insertion utilisateur: $response');

      // Vérification si la réponse contient des données
      if (response != null && response.isNotEmpty) {
        final user = response[0]; // Récupérer l'utilisateur inséré
        print('Utilisateur inséré: ${user['name']}, ID: ${user['user_id']}');

        final id = user['user_id']; // L'ID est dans la clé 'user_id'
        final idAsString = id.toString(); // Convertir l'ID en String
        print('ID converti en String: $idAsString');

        return idAsString; // Retourner l'ID converti en String
      } else {
        print('Réponse d\'insertion vide ou nulle');
      }
    } catch (error) {
      print("Erreur lors de l'insertion utilisateur: $error");
    }

    //return null;
    return Future.delayed(loadingTime)
        .then((value) => null); // Retourne null si l'authentification réussit
  }

  // Fonction pour récupérer le mot de passe
  Future<String?> _recoverPassword(String data) async {
    // Simule un délai pour la récupération du mot de passe
    return Future.delayed(loadingTime).then((value) =>
        null); // Retourne null si la récupération du mot de passe réussit
  }

  // Fonction pour l'inscription de l'utilisateur
  Future<String?> _signupUser(SignupData data) {
    // final response = await Supabase.instance.client.from('users').insert([
    //   {'name': name},
    // ]).select();

    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loadingTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        onLogin:
            _authUser, // Passer la fonction _authUser (attend un LoginData et retourne un Future<String?>)
        onRecoverPassword:
            _recoverPassword, // Passer la fonction _recoverPassword (attend un String et retourne un Future<String?>)
        onSignup:
            _signupUser, // Passer la fonction signUpUser (attend un SignUpData et retourne un Future<String?>)
        // Facultatif : titre de la page de login
      ),
    );
  }
}
