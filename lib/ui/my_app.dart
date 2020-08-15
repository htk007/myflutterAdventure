// Ekrandaki öğeler bir buton tıklamasıyla yada bir aksiyonla değişmez.
//etkileşim istemediğimiz için Statelesswidget kullandık.
import 'package:flutter/material.dart';

import 'resim_ve_buton_turleri.dart';

class MyApp extends StatelessWidget{
  @override
  //Bu widgetin amacı ekrana yazılacak olan widgeti geri döndermek.
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Scaffold(
          appBar: AppBar(
            title: Text(
              "HK Flutter Tutorial PART-II",
              style: TextStyle(fontSize: 18.0, color: Colors.white70),
            ),
          ),
          body: ResimVeButonTurleri()
        //her sayfada farklı bir body olmasını istiyorsak bu şekilde  farklı bir class içinden çağırabiliriz(burada aynı sayfada yaptık
        // ama normalde başka dosyadan da çağırabiliriz.
        // Önemli olan kod kalabalığını engellemek.
      ),
    );
  }
}