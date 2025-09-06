import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'geolocalisation_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/Gemini_Generated_Image_b8lqp0b8lqp0b8lq.webp',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text("GestiBTP", style: GoogleFonts.poppins()),
          ],
        ),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: _buildDrawer(context),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/monimg2.webp'),
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
          _buildDrawerItem(context, "Gérer Dépenses", Icons.attach_money,
              const DepensePage()),
          _buildDrawerItem(
              context, "Gérer Stock", Icons.inventory, const StockPage()),
          _buildDrawerItem(
              context, "Gérer Projets", Icons.engineering, const ProjetPage()),
          _buildDrawerItem(
              context, "Gérer Carnet", Icons.book, const CarnetPage()),
          _buildDrawerItem(context, "Gérer Utilisateurs", Icons.people,
              const UtilisateurPage()),
          _buildDrawerItem(
              context, "Gérer Adresse", Icons.location_on, const AdressePage()),
          _buildDrawerItem(context, "Chatbot", Icons.chat, const ChatbotPage()),
          _buildDrawerItem(context, "Géolocalisation", Icons.my_location,
              const GeolocalisationPage()),
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

  ListTile _buildDrawerItem(
      BuildContext context, String title, IconData icon, Widget page) {
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
    final List<_SousModuleDepense> sousModules = [
      _SousModuleDepense(
        titre: "Mode de paiement",
        description: "Gérer les modes de paiement.",
        icone: Icons.payment,
        couleur: Colors.blue,
        page: const ModePaiementDepensePage(),
      ),
      _SousModuleDepense(
        titre: "Catégories",
        description: "Gérer les catégories de dépenses.",
        icone: Icons.category,
        couleur: Colors.green,
        page: const CategorieDepensePage(),
      ),
      _SousModuleDepense(
        titre: "État de dépenses",
        description: "Gérer les états de dépenses.",
        icone: Icons.assignment_turned_in,
        couleur: Colors.purple,
        page: const EtatDepensePage(),
      ),
      _SousModuleDepense(
        titre: "Créer dépense",
        description: "Ajouter une nouvelle dépense.",
        icone: Icons.add_box,
        couleur: Colors.orange,
        page: const CreerDepensePage(),
      ),
      _SousModuleDepense(
        titre: "Lister dépenses",
        description: "Voir toutes les dépenses.",
        icone: Icons.list_alt,
        couleur: Colors.teal,
        page: const ListerDepensePage(),
      ),
      _SousModuleDepense(
        titre: "Valider dépense",
        description: "Valider une dépense enregistrée.",
        icone: Icons.verified,
        couleur: Colors.red,
        page: const ValiderDepensePage(),
      ),
      _SousModuleDepense(
        titre: "Suivre dépense",
        description: "Suivre l'état d'une dépense.",
        icone: Icons.track_changes,
        couleur: Colors.indigo,
        page: const SuivreDepensePage(),
      ),
      _SousModuleDepense(
        titre: "Modifier dépense",
        description: "Modifier une dépense existante.",
        icone: Icons.edit,
        couleur: Colors.brown,
        page: const ModifierDepensePage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion des Dépenses", style: GoogleFonts.poppins()),
        backgroundColor: Colors.green,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Actions Dépenses",
              style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.1,
                ),
                itemCount: sousModules.length,
                itemBuilder: (context, index) {
                  final module = sousModules[index];
                  return _SousModuleDepenseCard(module: module);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SousModuleDepense {
  final String titre;
  final String description;
  final IconData icone;
  final Color couleur;
  final Widget page;
  const _SousModuleDepense({
    required this.titre,
    required this.description,
    required this.icone,
    required this.couleur,
    required this.page,
  });
}

class _SousModuleDepenseCard extends StatelessWidget {
  final _SousModuleDepense module;
  const _SousModuleDepenseCard({required this.module});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => module.page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: module.couleur.withOpacity(0.15),
                radius: 30,
                child: Icon(module.icone, color: module.couleur, size: 34),
              ),
              const SizedBox(height: 16),
              Text(
                module.titre,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                module.description,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Pages vides pour chaque sous-module (à compléter avec les formulaires spécifiques ensuite)
class ModePaiementDepensePage extends StatefulWidget {
  const ModePaiementDepensePage({super.key});
  @override
  State<ModePaiementDepensePage> createState() =>
      _ModePaiementDepensePageState();
}

class _ModePaiementDepensePageState extends State<ModePaiementDepensePage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String nom = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mode de paiement')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Mode'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Nom du mode de paiement'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un nom'
                      : null,
                  onSaved: (value) => nom = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (value) => description = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Mode de paiement enregistré !')),
                      );
                    }
                  },
                  child: const Text('Enregistrer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategorieDepensePage extends StatefulWidget {
  const CategorieDepensePage({super.key});
  @override
  State<CategorieDepensePage> createState() => _CategorieDepensePageState();
}

class _CategorieDepensePageState extends State<CategorieDepensePage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String nom = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catégories')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Catégorie'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Nom de la catégorie'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un nom'
                      : null,
                  onSaved: (value) => nom = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (value) => description = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Catégorie enregistrée !')),
                      );
                    }
                  },
                  child: const Text('Enregistrer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EtatDepensePage extends StatefulWidget {
  const EtatDepensePage({super.key});
  @override
  State<EtatDepensePage> createState() => _EtatDepensePageState();
}

class _EtatDepensePageState extends State<EtatDepensePage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String libelle = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('État de dépenses')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID État'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Libellé'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un libellé'
                      : null,
                  onSaved: (value) => libelle = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (value) => description = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('État de dépense enregistré !')),
                      );
                    }
                  },
                  child: const Text('Enregistrer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreerDepensePage extends StatefulWidget {
  const CreerDepensePage({super.key});
  @override
  State<CreerDepensePage> createState() => _CreerDepensePageState();
}

class _CreerDepensePageState extends State<CreerDepensePage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String montant = '';
  String categorie = '';
  String modePaiement = '';
  String date = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Créer dépense')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Dépense'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Montant'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un montant'
                      : null,
                  onSaved: (value) => montant = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Catégorie'),
                  onSaved: (value) => categorie = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Mode de paiement'),
                  onSaved: (value) => modePaiement = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Date'),
                  onSaved: (value) => date = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (value) => description = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Dépense créée !')),
                      );
                    }
                  },
                  child: const Text('Créer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListerDepensePage extends StatelessWidget {
  const ListerDepensePage({super.key});
  @override
  Widget build(BuildContext context) {
    final depenses = [
      {
        'id': 'D001',
        'montant': '1000',
        'categorie': 'Fournitures',
        'etat': 'Validée'
      },
      {
        'id': 'D002',
        'montant': '500',
        'categorie': 'Transport',
        'etat': 'En attente'
      },
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Lister dépenses')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Rechercher',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: depenses.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final depense = depenses[index];
                  return ListTile(
                    leading: const Icon(Icons.money),
                    title: Text('Montant: ${depense['montant']}'),
                    subtitle: Text(
                        '${depense['id']} • ${depense['categorie']} • ${depense['etat']}'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ValiderDepensePage extends StatefulWidget {
  const ValiderDepensePage({super.key});
  @override
  State<ValiderDepensePage> createState() => _ValiderDepensePageState();
}

class _ValiderDepensePageState extends State<ValiderDepensePage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String etat = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Valider dépense')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Dépense'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'État'),
                  items: const [
                    DropdownMenuItem(value: 'Validée', child: Text('Validée')),
                    DropdownMenuItem(
                        value: 'En attente', child: Text('En attente')),
                    DropdownMenuItem(value: 'Rejetée', child: Text('Rejetée')),
                  ],
                  validator: (value) => value == null || value.isEmpty
                      ? 'Sélectionnez un état'
                      : null,
                  onChanged: (value) => etat = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Dépense validée !')),
                      );
                    }
                  },
                  child: const Text('Valider'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuivreDepensePage extends StatefulWidget {
  const SuivreDepensePage({super.key});
  @override
  State<SuivreDepensePage> createState() => _SuivreDepensePageState();
}

class _SuivreDepensePageState extends State<SuivreDepensePage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Suivre dépense')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Dépense'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Suivi de la dépense effectué !')),
                      );
                    }
                  },
                  child: const Text('Suivre'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ModifierDepensePage extends StatefulWidget {
  const ModifierDepensePage({super.key});
  @override
  State<ModifierDepensePage> createState() => _ModifierDepensePageState();
}

class _ModifierDepensePageState extends State<ModifierDepensePage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String montant = '';
  String categorie = '';
  String modePaiement = '';
  String date = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modifier dépense')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Dépense'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Montant'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un montant'
                      : null,
                  onSaved: (value) => montant = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Catégorie'),
                  onSaved: (value) => categorie = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Mode de paiement'),
                  onSaved: (value) => modePaiement = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Date'),
                  onSaved: (value) => date = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (value) => description = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Dépense modifiée !')),
                      );
                    }
                  },
                  child: const Text('Modifier'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SousModuleStock {
  final String titre;
  final String description;
  final IconData icone;
  final Color couleur;
  final Widget page;
  const _SousModuleStock({
    required this.titre,
    required this.description,
    required this.icone,
    required this.couleur,
    required this.page,
  });
}

class _SousModuleStockCard extends StatelessWidget {
  final _SousModuleStock module;
  const _SousModuleStockCard({required this.module});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => module.page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: module.couleur.withOpacity(0.15),
                radius: 30,
                child: Icon(module.icone, color: module.couleur, size: 34),
              ),
              const SizedBox(height: 16),
              Text(
                module.titre,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                module.description,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_SousModuleStock> sousModules = [
      _SousModuleStock(
        titre: "Créer produit",
        description: "Ajouter un nouveau produit au stock.",
        icone: Icons.add_box,
        couleur: Colors.green,
        page: const CreerProduitPage(),
      ),
      _SousModuleStock(
        titre: "Effectuer approvisionnement",
        description: "Enregistrer un nouvel approvisionnement.",
        icone: Icons.local_shipping,
        couleur: Colors.blue,
        page: const EffectuerApproPage(),
      ),
      _SousModuleStock(
        titre: "Lister produits",
        description: "Voir tous les produits en stock.",
        icone: Icons.list_alt,
        couleur: Colors.orange,
        page: const ListerProduitPage(),
      ),
      _SousModuleStock(
        titre: "Lister magasin",
        description: "Voir la liste des magasins.",
        icone: Icons.store,
        couleur: Colors.purple,
        page: const ListerMagasinPage(),
      ),
      _SousModuleStock(
        titre: "Inventaires",
        description: "Réaliser ou consulter un inventaire.",
        icone: Icons.inventory,
        couleur: Colors.teal,
        page: const InventairePage(),
      ),
      _SousModuleStock(
        titre: "Supprimer produit",
        description: "Retirer un produit du stock.",
        icone: Icons.delete,
        couleur: Colors.red,
        page: const SupprimerProduitPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion du Stock", style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Actions Stock",
              style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade700),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.1,
                ),
                itemCount: sousModules.length,
                itemBuilder: (context, index) {
                  final module = sousModules[index];
                  return _SousModuleStockCard(module: module);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjetPage extends StatelessWidget {
  const ProjetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_SousModuleProjet> sousModules = [
      _SousModuleProjet(
        titre: "Ajouter projet",
        description: "Créer un nouveau projet.",
        icone: Icons.add_box,
        couleur: Colors.green,
        page: const AjouterProjetPage(),
      ),
      _SousModuleProjet(
        titre: "Modifier projet",
        description: "Mettre à jour les informations d'un projet.",
        icone: Icons.edit,
        couleur: Colors.orange,
        page: const ModifierProjetPage(),
      ),
      _SousModuleProjet(
        titre: "Supprimer projet",
        description: "Supprimer un projet existant.",
        icone: Icons.delete,
        couleur: Colors.red,
        page: const SupprimerProjetPage(),
      ),
      _SousModuleProjet(
        titre: "Lister projets",
        description: "Voir tous les projets.",
        icone: Icons.list_alt,
        couleur: Colors.blue,
        page: const ListerProjetPage(),
      ),
      _SousModuleProjet(
        titre: "Planifier projet",
        description: "Planifier les étapes d'un projet.",
        icone: Icons.event_note,
        couleur: Colors.purple,
        page: const PlanifierProjetPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion des Projets", style: GoogleFonts.poppins()),
        backgroundColor: Colors.blue,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Actions Projet",
              style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.1,
                ),
                itemCount: sousModules.length,
                itemBuilder: (context, index) {
                  final module = sousModules[index];
                  return _SousModuleProjetCard(module: module);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SousModuleProjet {
  final String titre;
  final String description;
  final IconData icone;
  final Color couleur;
  final Widget page;
  const _SousModuleProjet({
    required this.titre,
    required this.description,
    required this.icone,
    required this.couleur,
    required this.page,
  });
}

class _SousModuleProjetCard extends StatelessWidget {
  final _SousModuleProjet module;
  const _SousModuleProjetCard({required this.module});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => module.page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: module.couleur.withOpacity(0.15),
                radius: 30,
                child: Icon(module.icone, color: module.couleur, size: 34),
              ),
              const SizedBox(height: 16),
              Text(
                module.titre,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                module.description,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AjouterProjetPage extends StatefulWidget {
  const AjouterProjetPage({super.key});
  @override
  State<AjouterProjetPage> createState() => _AjouterProjetPageState();
}

class _AjouterProjetPageState extends State<AjouterProjetPage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String nom = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un projet", style: GoogleFonts.poppins()),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Projet'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nom du projet'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un nom'
                      : null,
                  onSaved: (value) => nom = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  onSaved: (value) => description = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Projet ajouté avec succès !')),
                      );
                    }
                  },
                  child: const Text('Ajouter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ModifierProjetPage extends StatefulWidget {
  const ModifierProjetPage({super.key});
  @override
  State<ModifierProjetPage> createState() => _ModifierProjetPageState();
}

class _ModifierProjetPageState extends State<ModifierProjetPage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String nom = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier un projet", style: GoogleFonts.poppins()),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Projet'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nom du projet'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un nom'
                      : null,
                  onSaved: (value) => nom = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  onSaved: (value) => description = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Projet modifié avec succès !')),
                      );
                    }
                  },
                  child: const Text('Modifier'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SupprimerProjetPage extends StatefulWidget {
  const SupprimerProjetPage({super.key});
  @override
  State<SupprimerProjetPage> createState() => _SupprimerProjetPageState();
}

class _SupprimerProjetPageState extends State<SupprimerProjetPage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Supprimer un projet", style: GoogleFonts.poppins()),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Projet'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Projet supprimé avec succès !')),
                      );
                    }
                  },
                  child: const Text('Supprimer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListerProjetPage extends StatelessWidget {
  const ListerProjetPage({super.key});
  @override
  Widget build(BuildContext context) {
    // Exemple statique, à remplacer par une vraie source de données
    final projets = [
      {
        'id': 'P001',
        'nom': 'Construction A',
        'description': 'Bâtiment principal'
      },
      {'id': 'P002', 'nom': 'Rénovation B', 'description': 'Réhabilitation'},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des projets", style: GoogleFonts.poppins()),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Rechercher',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: projets.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final projet = projets[index];
                    return ListTile(
                      leading: const Icon(Icons.business),
                      title: Text(projet['nom']!),
                      subtitle:
                          Text('${projet['id']} • ${projet['description']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.event_note,
                                color: Colors.purple),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanifierProjetPage extends StatefulWidget {
  const PlanifierProjetPage({super.key});
  @override
  State<PlanifierProjetPage> createState() => _PlanifierProjetPageState();
}

class _PlanifierProjetPageState extends State<PlanifierProjetPage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String etape = '';
  String dateDebut = '';
  String dateFin = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Planifier un projet", style: GoogleFonts.poppins()),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Projet'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Étape'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer une étape'
                      : null,
                  onSaved: (value) => etape = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Date de début'),
                  onSaved: (value) => dateDebut = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Date de fin'),
                  onSaved: (value) => dateFin = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Projet planifié avec succès !')),
                      );
                    }
                  },
                  child: const Text('Planifier'),
                ),
              ],
            ),
          ),
        ),
      ),
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
      body: Center(
          child:
              Text("Module Carnet", style: GoogleFonts.poppins(fontSize: 24))),
    );
  }
}

class CreerUtilisateurPage extends StatefulWidget {
  const CreerUtilisateurPage({super.key});

  @override
  State<CreerUtilisateurPage> createState() => _CreerUtilisateurPageState();
}

class _CreerUtilisateurPageState extends State<CreerUtilisateurPage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String nom = '';
  String email = '';
  String motDePasse = '';
  String role = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer un utilisateur", style: GoogleFonts.poppins()),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nom'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un nom'
                      : null,
                  onSaved: (value) => nom = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value == null || !value.contains('@')
                      ? 'Veuillez entrer un email valide'
                      : null,
                  onSaved: (value) => email = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Mot de passe'),
                  obscureText: true,
                  validator: (value) => value == null || value.length < 6
                      ? 'Au moins 6 caractères'
                      : null,
                  onSaved: (value) => motDePasse = value ?? '',
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Rôle'),
                  items: const [
                    DropdownMenuItem(
                        value: 'Coordonateur', child: Text('Coordonateur')),
                    DropdownMenuItem(
                        value: 'Magasinier', child: Text('Magasinier')),
                    DropdownMenuItem(
                        value: 'Caissier', child: Text('Caissier')),
                    DropdownMenuItem(value: 'Client', child: Text('Client')),
                  ],
                  validator: (value) => value == null || value.isEmpty
                      ? 'Sélectionnez un rôle'
                      : null,
                  onChanged: (value) => role = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Utilisateur créé avec succès !')),
                      );
                    }
                  },
                  child: const Text('Créer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListerUtilisateurPage extends StatelessWidget {
  const ListerUtilisateurPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple statique, à remplacer par une vraie source de données
    final utilisateurs = [
      {'nom': 'Alice', 'email': 'alice@mail.com', 'role': 'Admin'},
      {'nom': 'Bob', 'email': 'bob@mail.com', 'role': 'Utilisateur'},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des utilisateurs", style: GoogleFonts.poppins()),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Rechercher',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: utilisateurs.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final user = utilisateurs[index];
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(user['nom']!),
                      subtitle: Text('${user['email']} • ${user['role']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.security,
                                color: Colors.purple),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModifierUtilisateurPage extends StatefulWidget {
  const ModifierUtilisateurPage({super.key});

  @override
  State<ModifierUtilisateurPage> createState() =>
      _ModifierUtilisateurPageState();
}

class _ModifierUtilisateurPageState extends State<ModifierUtilisateurPage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String nom = '';
  String email = '';
  String role = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier un utilisateur", style: GoogleFonts.poppins()),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nom'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un nom'
                      : null,
                  onSaved: (value) => nom = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value == null || !value.contains('@')
                      ? 'Veuillez entrer un email valide'
                      : null,
                  onSaved: (value) => email = value ?? '',
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Rôle'),
                  items: const [
                    DropdownMenuItem(
                        value: 'Coordonateur', child: Text('Coordonateur')),
                    DropdownMenuItem(
                        value: 'Magasinier', child: Text('Magasinier')),
                    DropdownMenuItem(
                        value: 'Caissier', child: Text('Caissier')),
                    DropdownMenuItem(value: 'Client', child: Text('Client')),
                  ],
                  validator: (value) => value == null || value.isEmpty
                      ? 'Sélectionnez un rôle'
                      : null,
                  onChanged: (value) => role = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Utilisateur modifié avec succès !')),
                      );
                    }
                  },
                  child: const Text('Modifier'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AccorderPrivilegePage extends StatefulWidget {
  const AccorderPrivilegePage({super.key});

  @override
  State<AccorderPrivilegePage> createState() => _AccorderPrivilegePageState();
}

class _AccorderPrivilegePageState extends State<AccorderPrivilegePage> {
  final _formKey = GlobalKey<FormState>();
  String utilisateur = '';
  String privilege = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accorder un privilège", style: GoogleFonts.poppins()),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Utilisateur'),
                  items: const [
                    DropdownMenuItem(value: 'Alice', child: Text('Alice')),
                    DropdownMenuItem(value: 'Bob', child: Text('Bob')),
                  ],
                  validator: (value) => value == null || value.isEmpty
                      ? 'Sélectionnez un utilisateur'
                      : null,
                  onChanged: (value) => utilisateur = value ?? '',
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Privilège'),
                  items: const [
                    DropdownMenuItem(value: 'Lecture', child: Text('Lecture')),
                    DropdownMenuItem(
                        value: 'Écriture', child: Text('Écriture')),
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                  ],
                  validator: (value) => value == null || value.isEmpty
                      ? 'Sélectionnez un privilège'
                      : null,
                  onChanged: (value) => privilege = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Privilège accordé avec succès !')),
                      );
                    }
                  },
                  child: const Text('Accorder'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UtilisateurPage extends StatelessWidget {
  const UtilisateurPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_SousModuleUtilisateur> sousModules = [
      _SousModuleUtilisateur(
        titre: "Créer utilisateur",
        description: "Ajouter un nouvel utilisateur à l'équipe.",
        icone: Icons.person_add,
        couleur: Colors.green,
        page: const CreerUtilisateurPage(),
      ),
      _SousModuleUtilisateur(
        titre: "Lister utilisateurs",
        description: "Voir et rechercher tous les utilisateurs.",
        icone: Icons.list_alt,
        couleur: Colors.blue,
        page: const ListerUtilisateurPage(),
      ),
      _SousModuleUtilisateur(
        titre: "Modifier utilisateur",
        description: "Mettre à jour les informations d'un utilisateur.",
        icone: Icons.edit,
        couleur: Colors.orange,
        page: const ModifierUtilisateurPage(),
      ),
      _SousModuleUtilisateur(
        titre: "Accorder privilège",
        description: "Gérer les droits et privilèges des utilisateurs.",
        icone: Icons.security,
        couleur: Colors.purple,
        page: const AccorderPrivilegePage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion des Utilisateurs", style: GoogleFonts.poppins()),
        backgroundColor: Colors.red,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Actions Utilisateur",
              style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.1,
                ),
                itemCount: sousModules.length,
                itemBuilder: (context, index) {
                  final module = sousModules[index];
                  return _SousModuleCard(module: module);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SousModuleUtilisateur {
  final String titre;
  final String description;
  final IconData icone;
  final Color couleur;
  final Widget page;
  const _SousModuleUtilisateur({
    required this.titre,
    required this.description,
    required this.icone,
    required this.couleur,
    required this.page,
  });
}

class _SousModuleCard extends StatelessWidget {
  final _SousModuleUtilisateur module;
  const _SousModuleCard({required this.module});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => module.page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: module.couleur.withOpacity(0.15),
                radius: 30,
                child: Icon(module.icone, color: module.couleur, size: 34),
              ),
              const SizedBox(height: 16),
              Text(
                module.titre,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                module.description,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Formulaires pour chaque sous-module stock
class CreerProduitPage extends StatefulWidget {
  const CreerProduitPage({super.key});
  @override
  State<CreerProduitPage> createState() => _CreerProduitPageState();
}

class _CreerProduitPageState extends State<CreerProduitPage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String nom = '';
  String categorie = '';
  String quantite = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer un produit", style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Produit'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Nom du produit'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un nom'
                      : null,
                  onSaved: (value) => nom = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Catégorie'),
                  onSaved: (value) => categorie = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Quantité'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer une quantité'
                      : null,
                  onSaved: (value) => quantite = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Produit créé avec succès !')),
                      );
                    }
                  },
                  child: const Text('Créer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EffectuerApproPage extends StatefulWidget {
  const EffectuerApproPage({super.key});
  @override
  State<EffectuerApproPage> createState() => _EffectuerApproPageState();
}

class _EffectuerApproPageState extends State<EffectuerApproPage> {
  final _formKey = GlobalKey<FormState>();
  String produit = '';
  String quantite = '';
  String fournisseur = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Effectuer un approvisionnement",
            style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Produit'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer le nom du produit'
                      : null,
                  onSaved: (value) => produit = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Quantité'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer une quantité'
                      : null,
                  onSaved: (value) => quantite = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Fournisseur'),
                  onSaved: (value) => fournisseur = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Approvisionnement enregistré !')),
                      );
                    }
                  },
                  child: const Text('Approvisionner'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListerProduitPage extends StatelessWidget {
  const ListerProduitPage({super.key});
  @override
  Widget build(BuildContext context) {
    final produits = [
      {
        'id': 'PR001',
        'nom': 'Ciment',
        'categorie': 'Matériaux',
        'quantite': '100'
      },
      {'id': 'PR002', 'nom': 'Fer', 'categorie': 'Matériaux', 'quantite': '50'},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des produits", style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Rechercher',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: produits.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final produit = produits[index];
                    return ListTile(
                      leading: const Icon(Icons.inventory),
                      title: Text(produit['nom']!),
                      subtitle: Text(
                          '${produit['id']} • ${produit['categorie']} • Qté: ${produit['quantite']}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListerMagasinPage extends StatelessWidget {
  const ListerMagasinPage({super.key});
  @override
  Widget build(BuildContext context) {
    final magasins = [
      {'id': 'M001', 'nom': 'Magasin Central'},
      {'id': 'M002', 'nom': 'Magasin Secondaire'},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des magasins", style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Rechercher',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: magasins.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final magasin = magasins[index];
                    return ListTile(
                      leading: const Icon(Icons.store),
                      title: Text(magasin['nom']!),
                      subtitle: Text('ID: ${magasin['id']}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InventairePage extends StatefulWidget {
  const InventairePage({super.key});
  @override
  State<InventairePage> createState() => _InventairePageState();
}

class _InventairePageState extends State<InventairePage> {
  final _formKey = GlobalKey<FormState>();
  String magasin = '';
  String date = '';
  String observations = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventaire", style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Magasin'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer le nom du magasin'
                      : null,
                  onSaved: (value) => magasin = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Date'),
                  onSaved: (value) => date = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Observations'),
                  maxLines: 3,
                  onSaved: (value) => observations = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Inventaire enregistré !')),
                      );
                    }
                  },
                  child: const Text('Enregistrer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SupprimerProduitPage extends StatefulWidget {
  const SupprimerProduitPage({super.key});
  @override
  State<SupprimerProduitPage> createState() => _SupprimerProduitPageState();
}

class _SupprimerProduitPageState extends State<SupprimerProduitPage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Supprimer un produit", style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Produit'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Produit supprimé avec succès !')),
                      );
                    }
                  },
                  child: const Text('Supprimer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdressePage extends StatelessWidget {
  const AdressePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_SousModuleAdresse> sousModules = [
      _SousModuleAdresse(
        titre: "Catégories",
        description: "Gérer les catégories d'adresses.",
        icone: Icons.category,
        couleur: Colors.blue,
        page: const AdresseCategoriePage(),
      ),
      _SousModuleAdresse(
        titre: "Clients",
        description: "Gérer les adresses des clients.",
        icone: Icons.person,
        couleur: Colors.green,
        page: const AdresseClientPage(),
      ),
      _SousModuleAdresse(
        titre: "Employés",
        description: "Gérer les adresses des employés.",
        icone: Icons.badge,
        couleur: Colors.orange,
        page: const AdresseEmployePage(),
      ),
      _SousModuleAdresse(
        titre: "Fournisseurs",
        description: "Gérer les adresses des fournisseurs.",
        icone: Icons.local_shipping,
        couleur: Colors.purple,
        page: const AdresseFournisseurPage(),
      ),
      _SousModuleAdresse(
        titre: "États d'adresse",
        description: "Gérer les états d'adresse.",
        icone: Icons.map,
        couleur: Colors.red,
        page: const AdresseEtatPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion des Adresses", style: GoogleFonts.poppins()),
        backgroundColor: Colors.blueGrey,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Actions Adresse",
              style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade700),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.1,
                ),
                itemCount: sousModules.length,
                itemBuilder: (context, index) {
                  final module = sousModules[index];
                  return _SousModuleAdresseCard(module: module);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SousModuleAdresse {
  final String titre;
  final String description;
  final IconData icone;
  final Color couleur;
  final Widget page;
  const _SousModuleAdresse({
    required this.titre,
    required this.description,
    required this.icone,
    required this.couleur,
    required this.page,
  });
}

class _SousModuleAdresseCard extends StatelessWidget {
  final _SousModuleAdresse module;
  const _SousModuleAdresseCard({required this.module});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => module.page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: module.couleur.withOpacity(0.15),
                radius: 30,
                child: Icon(module.icone, color: module.couleur, size: 34),
              ),
              const SizedBox(height: 16),
              Text(
                module.titre,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                module.description,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdresseCategoriePage extends StatefulWidget {
  const AdresseCategoriePage({super.key});
  @override
  State<AdresseCategoriePage> createState() => _AdresseCategoriePageState();
}

class _AdresseCategoriePageState extends State<AdresseCategoriePage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String nom = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catégories')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Catégorie'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Nom de la catégorie'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un nom'
                      : null,
                  onSaved: (value) => nom = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (value) => description = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Catégorie enregistrée !')),
                      );
                    }
                  },
                  child: const Text('Enregistrer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdresseClientPage extends StatefulWidget {
  const AdresseClientPage({super.key});
  @override
  State<AdresseClientPage> createState() => _AdresseClientPageState();
}

class _AdresseClientPageState extends State<AdresseClientPage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String nom = '';
  String adresse = '';
  String ville = '';
  String telephone = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clients')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Client'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nom du client'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un nom'
                      : null,
                  onSaved: (value) => nom = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Adresse'),
                  onSaved: (value) => adresse = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Ville'),
                  onSaved: (value) => ville = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Téléphone'),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) => telephone = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => email = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Adresse client enregistrée !')),
                      );
                    }
                  },
                  child: const Text('Enregistrer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdresseEmployePage extends StatefulWidget {
  const AdresseEmployePage({super.key});
  @override
  State<AdresseEmployePage> createState() => _AdresseEmployePageState();
}

class _AdresseEmployePageState extends State<AdresseEmployePage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String nom = '';
  String adresse = '';
  String ville = '';
  String telephone = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employés')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID Employé'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Nom de l\'employé'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un nom'
                      : null,
                  onSaved: (value) => nom = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Adresse'),
                  onSaved: (value) => adresse = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Ville'),
                  onSaved: (value) => ville = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Téléphone'),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) => telephone = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => email = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Adresse employé enregistrée !')),
                      );
                    }
                  },
                  child: const Text('Enregistrer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdresseFournisseurPage extends StatefulWidget {
  const AdresseFournisseurPage({super.key});
  @override
  State<AdresseFournisseurPage> createState() => _AdresseFournisseurPageState();
}

class _AdresseFournisseurPageState extends State<AdresseFournisseurPage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String nom = '';
  String adresse = '';
  String ville = '';
  String telephone = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fournisseurs')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'ID Fournisseur'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Nom du fournisseur'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un nom'
                      : null,
                  onSaved: (value) => nom = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Adresse'),
                  onSaved: (value) => adresse = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Ville'),
                  onSaved: (value) => ville = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Téléphone'),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) => telephone = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => email = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Adresse fournisseur enregistrée !')),
                      );
                    }
                  },
                  child: const Text('Enregistrer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdresseEtatPage extends StatefulWidget {
  const AdresseEtatPage({super.key});
  @override
  State<AdresseEtatPage> createState() => _AdresseEtatPageState();
}

class _AdresseEtatPageState extends State<AdresseEtatPage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String libelle = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("États d'adresse")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ID État'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un ID'
                      : null,
                  onSaved: (value) => id = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Libellé'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un libellé'
                      : null,
                  onSaved: (value) => libelle = value ?? '',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (value) => description = value ?? '',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('État d\'adresse enregistré !')),
                      );
                    }
                  },
                  child: const Text('Enregistrer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});
  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final List<Map<String, String>> messages = [];
  final TextEditingController controller = TextEditingController();

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      messages.add({'role': 'user', 'text': text});
      // Réponse automatique de démo
      messages.add({'role': 'bot', 'text': getBotResponse(text)});
    });
    controller.clear();
  }

  String getBotResponse(String userText) {
    // Réponse de démo, à remplacer par une vraie logique ou API
    if (userText.toLowerCase().contains('bonjour')) {
      return 'Bonjour ! Comment puis-je vous aider ?';
    } else if (userText.toLowerCase().contains('aide')) {
      return 'Je peux vous aider à gérer vos modules, utilisateurs, projets, etc.';
    } else {
      return 'Je suis un chatbot de démonstration.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chatbot')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isUser = msg['role'] == 'user';
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blueAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      msg['text'] ?? '',
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Écrivez votre message...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: sendMessage,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: () => sendMessage(controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
