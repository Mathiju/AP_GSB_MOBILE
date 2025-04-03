import 'package:flutter/material.dart';
import 'package:ap_gsb_mobile/view/mobile.dart'; // Assurez-vous que le chemin d'importation est correct

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fond.jpg'), // Remplacez par le nom de votre image
            fit: BoxFit.cover, // Ajuste l'image pour couvrir l'écran
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: const Color.fromARGB(143, 255, 255, 255), // Couleur de fond du conteneur
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(66, 255, 255, 255),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Connexion à votre compte',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Naviguer vers la page mobile
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  child: Text('Se connecter'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // Bouton de pleine largeur
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Couleur de fond du bouton
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0), // Couleur du texte du bouton
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
