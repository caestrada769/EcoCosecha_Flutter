import 'package:flutter/material.dart';

final List imgList = [
  [
    'https://www.fundacionaquae.org/wp-content/uploads/2021/04/agricultura-sostenible.jpg','Agricultura'
  ],
  [
    'https://ecuadorcomunicacion.com/wp-content/uploads/2022/08/agricultura.jpeg','Agricultura'
    
  ],
  [
    'https://agrotendencia.tv/wp-content/uploads/2022/01/Plantas-soya.jpg','Agricultura'
    
  ],
  [
    'https://media.licdn.com/dms/image/C4D12AQEKKY9hFeSsQQ/article-cover_image-shrink_720_1280/0/1635704089018?e=2147483647&v=beta&t=I0N2Wk7Utpu91yrPr6WuwtrUHpchLSsmOgC9MR00mPk','Agricultura'
    
  ],
  [
    'https://media.licdn.com/dms/image/C4E12AQEb8YicUMezTA/article-cover_image-shrink_720_1280/0/1652351468344?e=2147483647&v=beta&t=RVbOTX4imU_--tJq9q_GloouyWACtnGkmxGohl7OkS4','Agricultura'
    
  ],
  [
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80','Agricultura'
    
  ]
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item[0], fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        '${item[1]}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ))
    .toList();