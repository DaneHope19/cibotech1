
import 'package:flutter/material.dart';
import 'event_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

  return Center (
    child:  Column( mainAxisAlignment: MainAxisAlignment.center,
      children:[

        Image.asset("assets/images/minia.jpg"),

        const Text(" SalonTech ",

          style: TextStyle (
              fontSize: 42,

              fontFamily: 'Poppins'
          ),
        ),
        const  Text ("Salon virtual de l'informatique.IA,Web 3.0,Métaverse & Objets connecté ...",
          style: TextStyle(
              fontSize : 21
          ),
          textAlign: TextAlign.center,
        ),
        const Padding(padding: EdgeInsets.only(top:29)),

      ],
    ),
  ) ;
  }
}