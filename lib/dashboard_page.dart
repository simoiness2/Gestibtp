import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestiBTP", style: GoogleFonts.poppins()),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: _buildDrawer(context),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_projects.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: FadeInDown(
              child: Text(
                "Bienvenue dans GestiBTP",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 8,
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blueGrey),
            child: Text(
              "Modules",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
            ),
          ),
          _buildDrawerItem(context, "Gérer Dépenses", Icons.attach_money, const DepensePage()),
          _buildDrawerItem(context, "Gérer Stock", Icons.inventory, const StockPage()),
          _buildDrawerItem(context, "Gérer Projets", Icons.engineering, const ProjetPage()),
          _buildDrawerItem(context, "Gérer Carnet", Icons.book, const CarnetPage()),
          _buildDrawerItem(context, "Gérer Utilisateurs", Icons.people, const UtilisateurPage()),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text("Déconnexion", style: GoogleFonts.poppins()),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/main');
            },
          ),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, String title, IconData icon, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey),
      title: Text(title, style: GoogleFonts.poppins()),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

class DepensePage extends StatelessWidget {
  const DepensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion des Dépenses", style: GoogleFonts.poppins()),
        backgroundColor: Colors.green,
      ),
      body: Center(child: Text("Module Dépenses", style: GoogleFonts.poppins(fontSize: 24))),
    );
  }
}

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion du Stock", style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange,
      ),
      body: Center(child: Text("Module Stock", style: GoogleFonts.poppins(fontSize: 24))),
    );
  }
}

class ProjetPage extends StatelessWidget {
  const ProjetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion des Projets", style: GoogleFonts.poppins()),
        backgroundColor: Colors.blue,
      ),
      body: Center(child: Text("Module Projets", style: GoogleFonts.poppins(fontSize: 24))),
    );
  }
}

class CarnetPage extends StatelessWidget {
  const CarnetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carnet de Contacts", style: GoogleFonts.poppins()),
        backgroundColor: Colors.purple,
      ),
      body: Center(child: Text("Module Carnet", style: GoogleFonts.poppins(fontSize: 24))),
    );
  }
}

class UtilisateurPage extends StatelessWidget {
  const UtilisateurPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion des Utilisateurs", style: GoogleFonts.poppins()),
        backgroundColor: Colors.red,
      ),
      body: Center(child: Text("Module Utilisateurs", style: GoogleFonts.poppins(fontSize: 24))),
    );
  }
}