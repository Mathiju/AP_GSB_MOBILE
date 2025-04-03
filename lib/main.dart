import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ap_gsb_mobile/view/login_page.dart'; 
import 'package:sizer/sizer.dart'; 
import 'package:ap_gsb_mobile/view/mobile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialisation de Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer( // Encapsulation de l'application dans Sizer
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false, // Désactivation du bandeau de débogage
          title: 'Navigation App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage(), 
        );
      },
    );
  }
}

class MobileInformationState extends StatefulWidget {
  const MobileInformationState({super.key});

  @override
  State<MobileInformationState> createState() => MobileInformationStateState();
}

class MobileInformationStateState extends State<MobileInformationState>
    with SingleTickerProviderStateMixin {
  late Stream<QuerySnapshot<Map<String, dynamic>>> _mobileStream = FirebaseFirestore.instance.collection('mobile').snapshots();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _mobileStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['cafe']),
              subtitle: Text(data['food']),
            );
          }).toList(),
        );
      },
    );
  }
}
