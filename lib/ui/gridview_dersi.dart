import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewDersi extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
        itemCount: 50,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
      return GestureDetector(
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.blueAccent,
                width: 5,
                style: BorderStyle.solid
            ),
            //BELLİ KÖŞELERE VERMEK İSTERSEK:
//          new Border(
//            top: new BorderSide(
//              color: Colors.teal,
//              width: 5,
//              style: BorderStyle.solid
//            ),
//            bottom: new BorderSide(
//              color: Colors.blueAccent,
//              width: 5,
//              style: BorderStyle.solid
//            )
//          ),
            //YUVARLAK ŞEKİL VERMEK İÇİN; kenar yumuşatma işlemleri
            //borderRadius: new BorderRadius.all(new Radius.circular(20.0)),  //shape: BoxShape.circle kullanırsak bunu kullanamayız. Yada tam tersi durum. Sadece birisini kullanabiliriz.
//BU ŞEKİLDE TÜM KENARLARI DA KAPLAYABİLİR.
//          Border.all(
//            color: Colors.teal,
//            width: 5,
//            style: BorderStyle.solid
//          ),
            boxShadow: [
              new BoxShadow(
                  color: Colors.blueAccent,
                  offset: new Offset(10.0, 5.0),
                  blurRadius: 10.0
              )
            ],
            shape: BoxShape.circle,
            color: Colors.blue[100*(index % 9)],
            gradient: LinearGradient(colors: [Colors.yellowAccent, Colors.redAccent], begin: Alignment.topCenter,end: Alignment.bottomCenter),
            image: DecorationImage(image: AssetImage("assets/images/hekaicon.jpg"),
                fit: BoxFit.scaleDown),
          ),
          // color: Colors.teal[100*(index % 9)],//decoration ile çakışır o yüzden bir tane yazmalıyız.
          margin: EdgeInsets.all(10),
          child:Padding(padding: EdgeInsets.all(10), child:Text("Hello $index", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: Colors.white),) ,),
        ),
        onTap:()=>debugPrint("Merhaba flutter $index tıklanıldı") ,
        onDoubleTap: ()=>debugPrint("Merhaba flutter $index çift (double)tıklanıldı"),
        onLongPress: ()=>debugPrint("Merhaba flutter $index uzun (long)tıklanıldı"),
        onHorizontalDragStart: (e)=>debugPrint("Merhaba flutter $index horizontal ($e)tıklanıldı"),
      );
        }
    );
  }

}

//GRIDVIEW COUNT KULLANIMI
/*
GridView.count(
        crossAxisCount: 2,  //soldan sağa , bir satırda, kaç tane eleman olsun ? bunu belirtiriz burada
        primary: false,
        reverse: true,//en son elemanı en başa yazar.
        scrollDirection: Axis.vertical,//yatayda dizer; ona göre scroll özelliği vermiş oluruz.
        padding:EdgeInsets.all(10) ,
        crossAxisSpacing: 20,
        mainAxisSpacing: 40,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade100,
            child: Text("Hello #1", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade200,
            child: Text("Hello #2", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Hello #3", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade400,
            child: Text("Hello #4", textAlign: TextAlign.center,),
          ),


        ],
    );
*/
//GRIDVIEW EXTEND KULLANIMI
/*
GridView.extent(
        maxCrossAxisExtent: 100,//tek bir elemanın "en fazla" genişliğini belirler yatayda kaplanacak alanın maksimumunu belirler.
        primary: false,
       // reverse: true,//en son elemanı en başa yazar.
        scrollDirection: Axis.vertical,//yatayda dizer; ona göre scroll özelliği vermiş oluruz.
        padding:EdgeInsets.all(10) ,
        crossAxisSpacing: 20,
        mainAxisSpacing: 40,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade100,
            child: Text("Hello #1", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade200,
            child: Text("Hello #2", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade300,
            child: Text("Hello #3", textAlign: TextAlign.center,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal.shade400,
            child: Text("Hello #4", textAlign: TextAlign.center,),
          ),


        ],
    );

 */