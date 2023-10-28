import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {

  final _formKey = GlobalKey <FormState>();

  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();
  String selectedConfType = 'talk';
  DateTime selectedConfDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    confNameController.dispose();
    speakerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin:const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column (
          children: [
            Container(
              margin:const EdgeInsets.only(bottom: 10),
              child: TextFormField(

                decoration: const InputDecoration(

                  labelText: 'Nom Conference',
                  hintText: 'Entrez le nom de la Conference',
                    border: OutlineInputBorder(),
                ),
                validator: (value){

                  if (value == null || value.isEmpty ){
                    return "tu dois completer ce texte ";
                  }
                  return null;

                },
                controller: speakerNameController,
             ),
            ),
            Container(
              margin:const EdgeInsets.only(bottom: 10),
              child: TextFormField(

                decoration: const InputDecoration(

                  labelText: 'Nom Conference',
                  hintText: 'Entrez le nom du Speaker',
                  border: OutlineInputBorder(),
                ),
                validator: (value){

                  if (value == null || value.isEmpty ){
                    return "tu dois completer ce texte ";
                  }
                  return null;
                },
                controller: speakerNameController,
              ),
            ),
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Choisir une date',
              ),
              mode: DateTimeFieldPickerMode.dateAndTime,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
               setState(() {
                 selectedConfDate = value;

               });
              },
            ),

            DropdownButtonFormField
              (items:const [
              DropdownMenuItem(value: 'talk',child: Text("talk show") ),
              DropdownMenuItem(value: 'Demo',child: Text("Demo de code") ),
              DropdownMenuItem(value: 'partner',child: Text("partner") )
            ],
                 value: selectedConfType,
                onChanged:(value){
                setState(() {
                  selectedConfType = value !;
                });
                }
            ),
          const SizedBox(

          ),

          ElevatedButton(
          onPressed: (){

      if ( _formKey.currentState!.validate()) {
        final confName = confNameController.text;
        final speakerName = speakerNameController.text;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Envoi en Cours"))
        );
        FocusScope.of(context).requestFocus( FocusNode());
        print("Ajout de a conf $confName par le speaker  $speakerName");
        print("type de conference $selectedConfType");
        print("Date de la conf $selectedConfDate");
         }
             },
              child: const Text('Envoyer')
          )

    ],
      )
    )
      );
  }
}





