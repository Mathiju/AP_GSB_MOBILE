import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'km_page.dart';
import 'food_page.dart';
import 'sleep_page.dart';
import 'cafe_page.dart';
import 'login_page.dart';
import 'other_page.dart';
import 'recap_page.dart';


void main() {
  runApp(MyApp());
}
/**********************************************************
 # Classe principale de l'application
 *********************************************************/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Navigation App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // Ajout des routes pour la navigation
          routes: {
            '/km_entry': (context) => KmEntryPage(),
            '/food': (context) => foodEntryPage(),
            '/sleep': (context) => sleepEntryPage(),
            '/cafe': (context) => cafeEntryPage(),
            '/other': (context) => otherEntryPage(),
            '/recap': (context) => recapEntryPage(),
          },
          home: MyHomePage(),
        );
      },
    );
  }
}
/**********************************************************
 # Fond de l'application et appbar
 *********************************************************/
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suivi de vos frais'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/fond.jpg',
              fit: BoxFit.cover, 
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            children: [
/**********************************************************
 # Bouton pour se rendre sur la page des frais de route
*********************************************************/
              IconButton(
                icon: ClipOval(
                  child: Image.asset(
                    'assets/images/car.jpg',
                    fit: BoxFit.cover,
                    width: 100, 
                    height: 100,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KmEntryPage()),
                  );
                },
              ),
/**********************************************************
 # Bouton pour se rendre sur la page des frais de repas
*********************************************************/
              IconButton(
                icon: ClipOval(
                  child: Image.asset(
                    'assets/images/couvert.png',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => foodEntryPage()),
                  );
                },
              ),
/*************************************************************
 # Bouton pour se rendre sur la page des frais de hotel(dodo)
*************************************************************/
              IconButton(
                icon: ClipOval(
                  child: Image.asset(
                    'assets/images/sleep.jpg',
                    fit: BoxFit.cover,
                    width: 100, 
                    height: 100,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sleepEntryPage()),
                  );
                },
              ),
/*************************************************************
 # Bouton pour se rendre sur la page des frais de pause café
*************************************************************/
              IconButton(
                icon: ClipOval(
                  child: Image.asset(
                    'assets/images/cafe.jpg',
                    fit: BoxFit.cover,
                    width: 100, 
                    height: 100,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cafeEntryPage()),
                  );
                },
              ),
/**********************************************************
 # Bouton pour se rendre sur la page des autres frais
*********************************************************/
              IconButton(
                icon: ClipOval(
                  child: Image.asset(
                    'assets/images/interogation.png',
                    fit: BoxFit.cover,
                    width: 100, 
                    height: 100,
                  ),
                ),
               onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => otherEntryPage()),
                  );
                },
              ),
/**********************************************************
 # Bouton pour se rendre sur la page recap de frais
*********************************************************/
              IconButton(
                icon: ClipOval(
                  child: Image.asset(
                    'assets/images/recap.png',
                    fit: BoxFit.cover,
                    width: 100, 
                    height: 100,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => recapEntryPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      // Ajout d'un bouton "Se déconnecter" en bas
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple[100], //  couleur de BottomAppBar 
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Naviguer vers la page de connexion
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Se déconnecter'), // Texte du bouton
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50), // Bouton de pleine largeur
              backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Changer la couleur de fond du bouton ici
              foregroundColor: const Color.fromARGB(255, 0, 0, 0), // Couleur du texte du bouton
            ),
          ),
        ),
      ),
    );
  }
}