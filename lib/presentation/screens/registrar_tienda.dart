import 'dart:io';


import 'package:agricultura_venta/widget/menu_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../datos/tiendas_list.dart';
import '../../dominio/models/tienda.dart';
import 'tienda_home.dart';

class TiendaRegistrationScreen extends StatefulWidget {
  const TiendaRegistrationScreen({super.key});

  @override
  State<TiendaRegistrationScreen> createState() =>
      _TiendaRegistrationScreenState();
}

class _TiendaRegistrationScreenState extends State<TiendaRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _ubicacionController = TextEditingController();
  String estado = 'Abierto';
  String photo = '';

   Future<void> _pickImage() async{
    final pickImage = 
      await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickImage != null){
        setState(() {
          photo = pickImage.path;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title: 'Registrar Tienda'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                controller: _nombreController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descripción'),
                controller: _descripcionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la descripción';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Ubicación'),
                controller: _ubicacionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la ubicación';
                  }
                  return null;
                },
              ),
             
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: DropdownButtonFormField<String>(
              //     value: estado,
              //     onChanged: (newValue) {
              //       setState(() {
              //         estado = newValue!;
              //       });
              //     },
              //     items: <String>['Abierto', 'Cerrado']
              //         .map<DropdownMenuItem<String>>(
              //           (String value) => DropdownMenuItem<String>(
              //             value: value,
              //             child: Text(value),
              //           ),
              //         )
              //         .toList(),
              //     decoration: const InputDecoration(
              //       labelText: 'Estado',
              //       border: OutlineInputBorder(),
              //     ),
              //   ),
              // ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Subir una foto', style: TextStyle(fontSize: 15),),
                ),
              ),
              if (photo.isNotEmpty) Image.file(File(photo)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var newTienda = Tienda(
                        nombre: _nombreController.text,
                        descripcion: _descripcionController.text,
                        ubicacion: _ubicacionController.text,
                        estado: estado,
                        photo: photo,
                      );

                      tiendas.add(newTienda);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TiendaHomeScreen(),
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registro exitoso'),
                        backgroundColor: Colors.green,),
                      );
                    }
                  },
                  child: const Text('Registrar', style: TextStyle(fontSize: 15),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}