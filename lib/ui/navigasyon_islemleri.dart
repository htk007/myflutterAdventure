import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigasyonIslemleri extends StatelessWidget {
  String sayfaAdi = "B SAYFASI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Navigasyon İşlemleri",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("A sayfasına git"),
              color: Colors.blueAccent,
              onPressed: () {
                //context: butona tıklanıldığında bu widget reeenin neresindeyiz gibi meta bilgileri kapsayan bilgidir.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ASayfasi()));
              },
            ),
            RaisedButton(
              child: Text("B sayfasına git & veri gönder"),
              color: Colors.redAccent,
              onPressed: () {
                //context: butona tıklanıldığında bu widget reeenin neresindeyiz gibi meta bilgileri kapsayan bilgidir.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BSayfasi(sayfaAdi)));
              },
            ),
            RaisedButton(
              child: Text("C sayfasına git"),
              color: Colors.brown,
              onPressed: () {
                //context: butona tıklanıldığında bu widget reeenin neresindeyiz gibi meta bilgileri kapsayan bilgidir.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CSayfasi()));
              },
            ),
            RaisedButton(
              child: Text("D sayfasına git ve gelirken veri getir"),
              color: Colors.deepPurple,
              onPressed: () {
                //context: butona tıklanıldığında bu widget reeenin neresindeyiz gibi meta bilgileri kapsayan bilgidir.
                //push methodu boolean bir değer alacak demektir. geriye dönen değeri.(popOlayindanSonraGelenDeger)
                Navigator.push<bool>(context,
                        MaterialPageRoute(builder: (context) => DSayfasi()))
                    .then((popOlayindanSonraGelenDeger) {
                  debugPrint(
                      "Pop işleminden gelen değer: $popOlayindanSonraGelenDeger");
                });
              },
            ),
            RaisedButton(
              child: Text("E sayfasına git ve Geri gelme"),
              color: Colors.deepOrangeAccent,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ESayfasi()));
              },
            ),
            RaisedButton(
              child: Text("Liste sayfasına git"),
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, "/listeSayfasi");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListeDetay extends StatelessWidget {
  int tiklanilanIndex=0;
  ListeDetay(this.tiklanilanIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Liste Detay Sayfası",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body:
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Liste elemanı $tiklanilanIndex tıklanıldı"),
        ),
    ),
    );
  }
}


class ListeSinif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Liste Sayfası",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return
              GestureDetector(
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=> ListeDetay(index)));
                  Navigator.pushNamed(context,"/detay/$index");
                } ,
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Liste elemanı $index"),
                    ))
              );

          },
          itemCount: 20,
        ));
  }
}

class ASayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "A sayfasi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "A sayfasına hoşgeldiniz!",
              style: TextStyle(color: Colors.red, fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}

class BSayfasi extends StatelessWidget {
  String gelenBaslikVerisi;

  BSayfasi(this.gelenBaslikVerisi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          gelenBaslikVerisi,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$gelenBaslikVerisi a hoşgeldiniz!",
              style: TextStyle(color: Colors.red, fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}

class CSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "C sayfasi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "C sayfasına hoşgeldiniz!",
              style: TextStyle(color: Colors.red, fontSize: 24),
            ),
            RaisedButton(
              color: Colors.orangeAccent,
              child: Text("Geri dön"),
              onPressed: () {
                Navigator.pop(
                    context); //stackteki bir önceki elemana geri dönmeyi sağlar.
              },
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text("A Sayfasına git"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ASayfasi()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class DSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        debugPrint("On willpop çalıştı");
        Navigator.pop(context, false);
        return Future.value(
            false); //kullanıcının çıkış yapmasını/butona basmasını engeller. geldiği sayfaya geri dönmeyecektir.
        //androidde onbackpressin içi burası, kendi popumu kendim yapacağım anlamındadır, false demek.
        //return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "D sayfasi",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "D sayfasına hoşgeldin! \n Buraya 'D sayfasına git' demeden gelmişsen,\n muhtemelen yanlış rota belirtilmesi sonucu seni default olarak buraya yönlendirdim",
                style: TextStyle(color: Colors.red, fontSize: 24),
              ),
              RaisedButton(
                color: Colors.pink,
                child: Text("Geri dön ve  veri gönder"),
                onPressed: () {
                  //bool değer gönderdiğimize dair notasyon vermiş olduk.
                  Navigator.pop<bool>(context,
                      true); //stackteki bir önceki elemana geri dönmeyi sağlar.
                  //senaryomuza göre kullanıcı işlem başarılıysa true göndermiş olsun.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ESayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E sayfasi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "E sayfasına hoşgeldiniz!",
              style: TextStyle(color: Colors.blueAccent, fontSize: 24),
            ),
            RaisedButton(
              child: Text("F sayfasına git"),
              color: Colors.pinkAccent,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FSayfasi()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class FSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "F sayfasi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "F sayfasına hoşgeldiniz!",
              style: TextStyle(color: Colors.pink, fontSize: 24),
            ),
            RaisedButton(
              child: Text("G sayfasına git"),
              color: Colors.pinkAccent,
              onPressed: () {
                //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> GSayfasi()));
                Navigator.pushReplacementNamed(context, "/GPage");
              },
            )
          ],
        ),
      ),
    );
  }
}

class GSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "G sayfasi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "G sayfasına hoşgeldiniz!",
              style: TextStyle(color: Colors.pink, fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
