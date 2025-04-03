import 'package:flutter/material.dart';



/**********************************************************
 # Classe des notes de frais dodo de l'application
 *********************************************************/
class sleepEntryPage extends StatefulWidget {
  @override
  _sleepEntryPageState createState() => _sleepEntryPageState();
}

class _sleepEntryPageState extends State<sleepEntryPage> {
  DateTime? selectedDate; // Variable pour stocker la date sélectionnée
  TextEditingController sleepController = TextEditingController(); // Contrôleur pour le champ de texte des kilomètres

  // Fonction pour afficher le sélecteur de date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked; // Mettre à jour la date sélectionnée
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suivi de vos frais : Nuits'),
      ),
      body: Stack(
        children: [
          // Image de fond
          Positioned.fill(
            child: Image.asset(
              'assets/images/fond.jpg', 
              fit: BoxFit.cover, 
            ),
          ),
          // Contenu centré
          Center(
            child: SingleChildScrollView( // Permettre le défilement si le contenu dépasse l'écran
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centre le contenu verticalement
                crossAxisAlignment: CrossAxisAlignment.center, // Centre le contenu horizontalement
                children: <Widget>[
                  // Image en haut
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/sleep.jpg', 
                      height: 100,
                      width: 100,
                    ),
                  ),
                  // Cadre pour le message d'alerte
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(169, 100, 53, 53), // Couleur de fond pour le cadre
                        borderRadius: BorderRadius.circular(8.0), // Coins arrondis
                        border: Border.all(color: const Color.fromARGB(255, 235, 58, 58), width: 2), // Bordure rouge
                      ),
                      padding: EdgeInsets.all(10), // Espacement interne
                      child: Text(
                        'Veuillez sélectionner une date et entrer le nombre de nuits.',
                        style: TextStyle(color: const Color.fromARGB(255, 235, 58, 58), fontSize: 18), // Style du texte
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // Cadre pour le sélecteur de date
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(169, 255, 255, 255), // Couleur de fond pour le cadre
                      borderRadius: BorderRadius.circular(8.0), // Coins arrondis
                      border: Border.all(color: const Color.fromARGB(255, 51, 95, 96), width: 2), // Bordure bleue
                    ),
                    padding: EdgeInsets.all(10), // Espacement interne
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Marge
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          selectedDate == null
                              ? 'Aucune date sélectionnée'
                              : '${selectedDate!.toLocal()}'.split(' ')[0], // Afficher la date sélectionnée
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context), // Ouvrir le sélecteur de date
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Cadre pour le champ de texte de l'entrée des kilomètres
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0), // Pour centrer le champ de texte
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(169, 255, 255, 255), // Couleur de fond pour le cadre
                        borderRadius: BorderRadius.circular(8.0), // Coins arrondis
                        border: Border.all(color: const Color.fromARGB(255, 51, 95, 96), width: 2), // Bordure bleue
                      ),
                      child: TextField(
                        controller: sleepController, // Associer le contrôleur
                        decoration: InputDecoration(
                          border: InputBorder.none, // Enlever la bordure par défaut
                          labelText: 'Nuits',
                          contentPadding: EdgeInsets.all(10), // Espacement interne
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Action pour valider ou enregistrer les données
                      if (selectedDate != null && sleepController.text.isNotEmpty) {
                        // Logique pour traiter les données
                        print('Date sélectionnée : ${selectedDate}');
                        print('Nuits : ${sleepController.text}');
                      } else {
                        // Afficher une alerte si la date ou nuits ne sont pas renseignés
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Veuillez sélectionner une date et entrer le nombre de nuits.')),
                        );
                      }
                    },
                    child: Text('Valider'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
