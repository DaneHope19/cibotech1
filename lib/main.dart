import 'package:cibotech/pages/add_event_page.dart';
import 'package:cibotech/pages/event_page.dart';
import 'package:cibotech/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

int _currentIndex = 0;
 setCurrentIndex(int index) {

   setState ((){

    _currentIndex = index;
   } );
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  [
             const Text("Welcome to Virtual Saloon"),
            const  Text("Liste des Conferenciers - Jours - Heures"),
            const  Text("Formulaire d'inscription"),

          ][_currentIndex],

        ),
        body:[

          const HomePage(),
          const EventPage(),
          const AddEventPage()
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setCurrentIndex(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accueil'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Planning'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Formulaire'
            )

          ],

        ),
      ),
    );
  }


}
