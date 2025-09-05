import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context, '/main');
    });
  }

  final List<Map<String, dynamic>> modules = [
    {
      'title': 'Dépenses',
      'icon': Icons.attach_money,
      'color': Colors.green,
      'animation': 'assets/animations/modules.json',
    },
    {
      'title': 'Stock',
      'icon': Icons.inventory,
      'color': Colors.orange,
      'animation': 'assets/animations/modules.json',
    },
    {
      'title': 'Projets',
      'icon': Icons.engineering,
      'color': Colors.blue,
      'animation': 'assets/animations/modules.json',
    },
    {
      'title': 'Carnet',
      'icon': Icons.book,
      'color': Colors.purple,
      'animation': 'assets/animations/modules.json',
    },
    {
      'title': 'Utilisateurs',
      'icon': Icons.people,
      'color': Colors.red,
      'animation': 'assets/animations/modules.json',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF90CAF9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInDown(
                child: Text(
                  'Bienvenue chez GestiBTP',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 8,
                        color: Colors.black45,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    enlargeCenterPage: true,
                    aspectRatio: 1.5,
                    viewportFraction: 0.7,
                  ),
                  items: modules.map((module) {
                    return FadeIn(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: module['color'].withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        elevation: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                module['color'].withOpacity(0.2),
                                module['color'].withOpacity(0.4),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                module['animation'],
                                height: 120,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                module['title'],
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Icon(
                                module['icon'],
                                size: 40,
                                color: module['color'],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}