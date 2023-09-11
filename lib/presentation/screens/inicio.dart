
import 'package:agricultura_venta/presentation/screens/tienda_home.dart';
import 'package:agricultura_venta/widget/menu_appbar.dart';
import 'package:agricultura_venta/widget/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'image_list.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMenu(title: 'EcoCosecha'),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 35,),
            const Text('Agricultura ecológica', style: TextStyle(fontSize: 30,),),
            const SizedBox(height: 35,),
             CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
          const SizedBox(height: 15,),
      
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Somos especialistas en productos para la agricultura profesional y ecológica, ofreciendo las mejores marcas de abonos y fertilizantes para obtener excelentes resultados en tus cultivos.', style: TextStyle(fontSize: 20, ),
            textAlign: TextAlign.center,),
          ),
      
          ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> const TiendaHomeScreen()),);
          }, child: const Text('Ver puntos de venta', style: TextStyle(fontSize: 20),))
          ],
        ),
      ),
    );
  }
}