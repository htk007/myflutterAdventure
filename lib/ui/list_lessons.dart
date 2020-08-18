//4. ders

import 'package:flutter/material.dart';

class ListeDersleri extends StatelessWidget {
  //Liste için veri kaynağı oluşturuyoruz:
  //List<int>listeNumaralari= List.filled(100, 0); //100 tane elemana sıfır değerini atar.
  List<int>listeNumaralari= List.generate(100, (index)=>index); //o an oluşan index değerini o elemana ata.
  List<String>listeAltBasliklar= List.generate(100, (index)=>"Liste elemanı alt başlık $index");
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listeNumaralari
          .map(
          (oAnkiDeger)=>  Column(
            children: <Widget>[
              Container(
                child: Card(
                  color: Colors.teal.shade200,
                  margin: EdgeInsets.all(10),
                  elevation: 10,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.accessibility),
                      radius: 12,
                    ),
                    title: Text("Liste eleman başlığı $oAnkiDeger"),
                    subtitle: Text(listeAltBasliklar[oAnkiDeger]),
                    trailing: Icon(Icons.add_circle),
                  ),
                ),
              )

            ],
    ),
    ).toList(),
    );
  }
}
//bu şekilde 100 tane eleman türettik.