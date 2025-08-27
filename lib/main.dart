import 'package:flutter/material.dart';
import 'accueil_page.dart';
import 'module_page.dart';
import 'login_page.dart';
import 'dashboard_page.dart';
import 'register_page.dart'; // ✅ Ajout de la page d'inscription

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GestiBTP',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,

      // ✅ Page de démarrage
      initialRoute: '/',

      // ✅ Toutes les routes centralisées ici
      routes: {
        '/': (context) => const AccueilPage(),          // Accueil
        '/modules': (context) => const ModulesPage(),    // Modules
        '/login': (context) => const LoginPage(),       // Connexion
        '/register': (context) => const RegisterPage(), // Inscription
        '/dashboard': (context) => const DashboardPage(), // Tableau de bord
      },
    );
  }
}