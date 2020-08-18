

import 'package:flutter/material.dart';
import 'dart:math' as matematik;
class CollapsableToolbarOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
//          title: Text(
//            "AppBar text here",
//            style: TextStyle(color: Colors.white),
//          ),
          backgroundColor: Colors.red,
          expandedHeight: 100,
          //tamamen açıkken ekranda ne kadar yer kaplasın sorusuna cevap.
          brightness: Brightness.dark,
          pinned: true,//toolbarım pinlenmiş şekilde görünecek mi görünmeyecek mi? üstteki alan title kayolsa bile görünecek mi görünmeyecek mi?
          floating: true,//true olursa aşağı doğru çektiğimde hemen görünecektir. false olursa görünmeyecektir.
         snap: true,//kullanıcı aşağı çektiğinde direkt olarak , bar açılır.
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Sliver app bar"),
            centerTitle: true,
            background: Image.asset("assets/images/hekaicon.jpg", fit: BoxFit.cover,),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(4),
          sliver: SliverList(
                      //STATİK OLARAK OLUŞTURACAKSAM BU YAPIYI KULLANIRIM.
            delegate: SliverChildListDelegate(sabitListeElemanlari(),),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver:SliverList(
                      //DİNAMİK OLARAK OLUŞTURACAKSAM BU YAPIYI KULLANIRIM
            delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon, childCount: 6),
          ) ,
        ),
        //sabit elemanlarla bir satırda kaç eleman olacağını söylediğimiz grid türü
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), //çalışma mantığı nasıl olacak? bir satırda kaç tane eleman olacak
          delegate: SliverChildListDelegate(sabitListeElemanlari()),     //elemanlar neler olacak?
        ),
        //dinamik elemanlarla bir satırda kaç eleman olacağını söylediğimiz grid türü
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon, childCount: 9),
        ),
        //Bu sefer bir satırda olacak eleman sayısı vermeyip; her elemanın maksimum genişliği bu kadar olsun ona göre yerleştir diyoruz.
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent:100),
          delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon, childCount: 8),
        ),
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverFixedExtentList(
            delegate:SliverChildListDelegate(sabitListeElemanlari()) ,//bu listenin üyeleri nasıl oluşturulacak?
            itemExtent: 200 ,//maximum yüksekliği
          ) , //Elemanları statik oluşturulan ama extent mantığıyla çalışan listview
        ),
        SliverPadding (
          padding: EdgeInsets.all(20),
          sliver: SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon, childCount: 10),
            itemExtent: 100,
          ),  //Elemanları dinamik oluşturulan ama extent mantığıyla çalışan listview
        ),
        //isimlendirilmiş contructorları olanları da kullanabiliriz;
        SliverGrid.count(crossAxisCount: 5, children: sabitListeElemanlari(),),
        SliverGrid.extent(maxCrossAxisExtent: 200, children: sabitListeElemanlari(),)
      ],
    );
  }

  List<Widget> sabitListeElemanlari() {
    return [
      Container(
        height: 100,
        color: Colors.teal,
        alignment: Alignment.center,
        child: Text("Sabit liste elemanı #1" ,style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
      ),
      Container(
        height: 100,
        color: Colors.lightGreen,
        alignment: Alignment.center,
        child: Text("Sabit liste elemanı #2" ,style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
      ),
      Container(
        height: 100,
        color: Colors.deepPurpleAccent,
        alignment: Alignment.center,
        child: Text("Sabit liste elemanı #3" ,style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
      ),
      Container(
        height: 100,
        color: Colors.yellowAccent,
        alignment: Alignment.center,
        child: Text("Sabit liste elemanı #4" ,style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
      ),


    ];
  }

  Widget _dinamikElemanUretenFonksiyon(BuildContext context, int index) {

    return      Container(
      height: 100,
      color: rastgeleRenkUret(),
      alignment: Alignment.center,
      child: Text("Dinamik liste elemanı ${index +1}" ,style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
    );
  }

  Color rastgeleRenkUret() {
    return Color.fromARGB(matematik.Random().nextInt(255), matematik.Random().nextInt(255), matematik.Random().nextInt(255), matematik.Random().nextInt(255));
  }
}
