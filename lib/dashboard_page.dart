import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GestiBTP"),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: _buildDrawer(context),
      body: Stack(
        children: [
          // ====== Image de fond (ou chatbot) ======
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_projects.jpg'), // ton image/chatbot
                fit: BoxFit.cover,
              ),
            ),
          ),
          // ====== Dégradé léger pour lisibilité ======
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.05),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // ====== Message de bienvenue ======
          Center(
            child: Text(
              "Bienvenue dans GestiBTP",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
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
        ],
      ),
    );
  }

  // ===== Drawer / Menu latéral =====
  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Text(
              "Modules",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildDrawerItem(context, "Gérer Dépenses", Icons.attach_money,
              const DepensePage()),
          _buildDrawerItem(context, "Gérer Stock", Icons.inventory,
              const StockPage()),
          _buildDrawerItem(context, "Gérer Projets", Icons.engineering,
              const ProjetPage()),
          _buildDrawerItem(context, "Gérer Carnet", Icons.book, const CarnetPage()),
          _buildDrawerItem(context, "Gérer Utilisateurs", Icons.people,
              const UtilisateurPage()),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(
      BuildContext context, String title, IconData icon, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // fermer le drawer
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

// ==================== MODULES ====================

class DepensePage extends StatelessWidget {
  const DepensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Text("Gestion des Dépenses"), backgroundColor: Colors.green),
      body: const Center(child: Text("Module Dépenses")),
    );
  }
}

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Text("Gestion du Stock"), backgroundColor: Colors.orange),
      body: const Center(child: Text("Module Stock")),
    );
  }
}

class ProjetPage extends StatelessWidget {
  const ProjetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Text("Gestion des Projets"), backgroundColor: Colors.blue),
      body: const Center(child: Text("Module Projets")),
    );
  }
}

class CarnetPage extends StatelessWidget {
  const CarnetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Text("Carnet de Contacts"), backgroundColor: Colors.purple),
      body: const Center(child: Text("Module Carnet")),
    );
  }
}

class UtilisateurPage extends StatelessWidget {
  const UtilisateurPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Text("Gestion des Utilisateurs"), backgroundColor: Colors.red),
      body: const Center(child: Text("Module Utilisateurs")),
    );
  }
}