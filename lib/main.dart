
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ui/navigasyon_islemleri.dart';
import 'ui/custom_scroll_ve_slivers.dart';
import 'ui/gridview_dersi.dart';
import 'ui/etkin_liste_ornek.dart';
import 'ui/list_lessons.dart';

import 'ui/my_app.dart';

//tek satırda ; void main() => MyApp();
void main() {
//  var myApp= new MyApp();
//  runApp(myApp);//runApp(MyApp()); şeklinde de kullanabilirdik.
//3. ders başlangıç
  //runApp(HekaApp());
  //3. ders bitiş

  //4. ders

  runApp(MaterialApp(
    title: "Heka Liste dersleri",
   // initialRoute: "/CPage/FPage/GPage",
    routes: {
      '/'      : (context)=> NavigasyonIslemleri(),
      '/CPage' : (context)=> CSayfasi(),
      '/CPage/FPage': (context)=> FSayfasi(),
      '/CPage/FPage/GPage' : (context)=> GSayfasi(),
      '/DPage' : (context)=> DSayfasi(),
      '/GPage' : (context)=> GSayfasi(),
      '/FPage' : (context)=> FSayfasi(),
      '/listeSayfasi': (context)=> ListeSinif(),
    },

    onGenerateRoute: (RouteSettings settings){
      List<String> pathElemanlari = settings.name.split("/");
      //  /detay/$index için;
      if(pathElemanlari[1]=='detay'){
        return MaterialPageRoute(builder: (context)=> ListeDetay(int.parse(pathElemanlari[2])));
      }
      //mesela başka bir durum daha olsaydı;
      //  /urun/detay/id ve /urun/ozellik/id için;
//      if(pathElemanlari[1]=='urun'){
//        if(pathElemanlari[2]=='detay'){
//          return MaterialPageRoute(builder: (context)=> ListeDetay(int.parse(pathElemanlari[3])));
//        }
//        else if(pathElemanlari[2]=='ozellik'){
//          return MaterialPageRoute(builder: (context)=> ListeDetay(int.parse(pathElemanlari[3])));
//        }
//      }
      return null;
    },

    onUnknownRoute: (RouteSettings settings)=>MaterialPageRoute(builder: (context)=>DSayfasi()), //eğer olurda rotada hata olursa bilinmeyen olursa vesair DSayfasina yönlendirdik. Eğer bu da tanımlı olmasaydı yada bulamasaydı kök rrota giderdi.
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    //home: NavigasyonIslemleri(),//yukarıda kök dizini tanımlamışsak buna gerek kalmaz, yoksa hata verir

  ));

}
//3. ders
//class HekaApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      theme: ThemeData(
//        /*textTheme: TextTheme(
//          display2: TextStyle(fontSize: 12),//varolan değerleri ezip kendimiz değerler verebiliriz.
//        ),*/
//        primarySwatch: Colors.blue,
//      ),
//      title: "MaterialApp Title",
//      home: HekaHomePage(title: "Heka Home Page"),
//    );
//  }
//}
//
//class HekaHomePage extends StatefulWidget {
//  //Buradaki bu değişkene bir defa değeri atar , bir daha değiştiremez. ( final kullanımı )
//  final String title;
//  int sayac = 0;
//
//  //süslü parantezler zorunlu olmadığı anlamına geliyor parametrelerin.
//  HekaHomePage({this.title}) {
//    debugPrint("HekaHomePage Statefull widget constructor");
//  }
//
//  @override
//  State<StatefulWidget> createState() {
//    debugPrint("HekaHomePage createState triggered");
//    return _HekaHomePageState();
//  }
////Burada neden bu şekilde bir kullanım yaptık? Çünkü;
///*
//  * final anahtar kelimesi eğer bir değişkenin değeri sabit kalacaksa kullanılır.
//  * "final" tanımlanmış bir değişkeni constructor'in body kısmından önce başlatmak zorundayız. Bu durumda 3 seçeneğimiz oluyor:
//  * 1 - Değişkenin değerini tanımladığımız yerde başlatabiliriz.
//  *****örneğin;
//  * class Deneme {final String yazi = "Bu bir deneme sınıfıdır";}
//  * ******
//  * 2 - Değişkenin değerini constructor'in parametre kısmında başlatabiliriz.
//  *****örneğin;
//  * class Deneme {
//                   final String yazi;
//                  Deneme(this.yazi);
//               * }
//   * *****
//  *3 - Değişkenin değerini initializer list içerisinde oluşturabiliriz.
//  ******örneğin;
//  * class Deneme {
//                  final String yazi;
//
//                  Deneme() : yazi = "Bu bir deneme sınıfıdır" {}
//                }
//  * */
//}
//
//class _HekaHomePageState extends State<HekaHomePage> {
//  _HekaHomePageState() {
//    debugPrint("HekaHomePageState constructor triggered");
//  }
//
//  @override //context, benim parent widgetlerim ile ilgili bilgi taşır.
//  Widget build(BuildContext context) {
//    debugPrint("HekaHomePageState build method triggered");
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//        //Sonuçta bu state illaki bir widgetla alakalı olmalı;
//        // o yüzden buraya widget. diyerek burada oluşturduğumuz state sınıfı  HekaHomePage e ait.
//        // bu şekilde de bu state hangi widgetin? HekaHomePage'in. O zaman onun alanlarına ulaşabiliyoruz.
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          //değer değişikkliğini ui da göstermek için,
//          //hey flutter ben bir değer değiştirdim o yüzden git ilgili stateless widgettaki ilgili widgeti güncelle demek için setState kullanırız.
//          //!! set state kendine en yakın olan buildi çalıştırır ve sadece değişenleri sıfırdan oluşturur, aksi takdirde flutter çok yavaş olurdu :)
//          setState(() {
//            debugPrint("Sayaç değeri arttırıldı, setState başladı.");
//            _sayacDegeriniArttir();
//          });
//        },
//        child: Icon(Icons.add),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            RaisedButton(
//              child: Text("Arttır"),
//              color: Colors.green,
//              onPressed: (){
//                setState(() {
//                  _sayacDegeriniArttir();
//                });
//              },
//            ),
//            Text("${widget.sayac}",
//                style: Theme.of(context).textTheme.display2.copyWith(
//                  //bu şekilde customize edebiliriz.
//                  color: widget.sayac<=0 ?Colors.red: Colors.green
//                )),
//            //Burada MaterialApp'ime dair bilgilere ulaşıp kullanabilirim.   basit hali ise böyle kullandık:  //TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
//            RaisedButton(
//              child: Text("Azalt"),
//              color:Colors.red,
//              onPressed: (){
//                setState(() {
//                  _sayacDegeriniAzalt();
//                });
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  void _sayacDegeriniArttir() {
//    widget.sayac++;
//    debugPrint("Sayaç değeri: ${widget.sayac}");
//  }
//  void _sayacDegeriniAzalt() {
//    widget.sayac--;
//    debugPrint("Sayaç değeri: ${widget.sayac}");
//  }
//}
