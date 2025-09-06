import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

// Thème de couleurs (aligned with MesureParcelleView)
const Color primaryGreen = Color(0xFF4CAF50);
const Color accentYellow = Color(0xFFFFC107);
const Color darkBrown = Color(0xFF5C4033);
const Color white = Color(0xFFFFFFFF);
const Color errorRed = Color(0xFFE76F51);

class GeolocalisationPage extends StatefulWidget {
  const GeolocalisationPage({super.key});

  @override
  State<GeolocalisationPage> createState() => _GeolocalisationPageState();
}

class _GeolocalisationPageState extends State<GeolocalisationPage> {
  Position? _currentPosition;
  String _status = 'Appuyez sur le bouton pour obtenir votre position';
  bool _isLoading = false;
  final MapController _mapController = MapController();

  Future<bool> _handleLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _status = 'Permission de localisation refusée';
          _isLoading = false;
        });
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _status = 'Permission de localisation refusée définitivement';
        _isLoading = false;
      });
      return false;
    }
    return true;
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
      _status = 'Vérification des permissions...';
    });

    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;

    try {
      setState(() {
        _status = 'Obtention de la position...';
      });

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
        _status = 'Position obtenue avec succès !';
        _isLoading = false;
        _mapController.move(
          LatLng(position.latitude, position.longitude),
          18.0,
        );
      });
    } catch (e) {
      setState(() {
        _status = 'Erreur lors de l\'obtention de la position: $e';
        _isLoading = false;
      });
    }
  }

  void _shareLocation() {
    if (_currentPosition != null) {
      final googleMapsUrl =
          'https://www.google.com/maps/search/?api=1&query=${_currentPosition!.latitude},${_currentPosition!.longitude}';
      Share.share(
        'Ma position actuelle : $googleMapsUrl',
        subject: 'Partage de ma position',
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Aucune position disponible à partager',
            style: GoogleFonts.roboto(fontSize: 16.sp, color: white),
          ),
          backgroundColor: errorRed,
        ),
      );
    }
  }

  void _showHelpDialog() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 1.0,
        builder: (_, controller) => Container(
          color: white,
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  controller: controller,
                  children: [
                    Text(
                      'Aide - Géolocalisation',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: darkBrown,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Cette page permet de visualiser et partager votre position actuelle sur une carte interactive. Voici les fonctionnalités disponibles :',
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        color: darkBrown.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    _buildHelpItem(
                      icon: Icons.my_location,
                      title: 'Obtenir la position',
                      description:
                      'Cliquez sur l\'icône de localisation pour centrer la carte sur votre position actuelle, en utilisant le GPS de votre appareil.',
                    ),
                    _buildHelpItem(
                      icon: Icons.share,
                      title: 'Partager la position',
                      description:
                      'Partagez votre position actuelle sous forme de lien Google Maps via des applications comme WhatsApp, SMS ou e-mail.',
                    ),
                    _buildHelpItem(
                      icon: Iconsax.info_circle,
                      title: 'Aide',
                      description:
                      'Affiche ce guide pour comprendre toutes les fonctionnalités de la page.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              CupertinoButton(
                color: primaryGreen,
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Fermer',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: primaryGreen, size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: darkBrown,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    color: darkBrown.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          'Géolocalisation',
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: darkBrown,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Iconsax.info_circle, color: primaryGreen, size: 24.sp),
            onPressed: _showHelpDialog,
            tooltip: 'Aide',
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentPosition != null
                  ? LatLng(_currentPosition!.latitude, _currentPosition!.longitude)
                  : LatLng(3.848, 11.502),
              initialZoom: 18.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              if (_currentPosition != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                      width: 15.w,
                      height: 15.h,
                      child: Icon(
                        Icons.my_location,
                        color: primaryGreen,
                        size: 25.sp,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          Positioned(
            top: 10.h,
            right: 10.w,
            child: Column(
              children: [
                _floatingBtn(
                  Icons.my_location,
                  _getCurrentLocation,
                  color: _isLoading ? darkBrown : primaryGreen,
                ),
                SizedBox(height: 8.h),
                if (_currentPosition != null)
                  _floatingBtn(
                    Icons.share,
                    _shareLocation,
                    color: accentYellow,
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: white,
              padding: EdgeInsets.all(12.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _status,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: darkBrown,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (_currentPosition != null) ...[
                    SizedBox(height: 8.h),
                    Text(
                      'Latitude: ${_currentPosition!.latitude.toStringAsFixed(6)}',
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        color: darkBrown.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      'Longitude: ${_currentPosition!.longitude.toStringAsFixed(6)}',
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        color: darkBrown.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      'Altitude: ${_currentPosition!.altitude.toStringAsFixed(2)} m',
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        color: darkBrown.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      'Précision: ${_currentPosition!.accuracy.toStringAsFixed(2)} m',
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        color: darkBrown.withOpacity(0.7),
                      ),
                    ),
                  ],
                  SizedBox(height: 8.h),
                  CupertinoButton(
                    color: primaryGreen,
                    onPressed: _isLoading ? null : _getCurrentLocation,
                    child: Text(
                      _isLoading ? 'Obtention...' : 'Obtenir ma position',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _floatingBtn(IconData icon, VoidCallback onTap, {Color? color}) {
    return FloatingActionButton(
      heroTag: icon.toString(),
      onPressed: onTap,
      backgroundColor: color ?? primaryGreen,
      child: Icon(icon, color: white),
    );
  }
}