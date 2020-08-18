import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EtkinListeOrnek extends StatelessWidget {
  List<Ogrenci> tumOgrenciler = [];

  @override
  Widget build(BuildContext context) {
    ogrenciVerileriniGetir(); //veri kaynağımı bu şekilde doldurdum.

    return ListView.separated(
        separatorBuilder: (context, index) {
          if (index % 4 == 0 && index != 0) {
            return Container(
              height: 2,
              color: Colors.black26,
            );
          } else {
            return Container();
          }
        },
        itemCount: 20,
        //kaç tane elaman oluşturulacak o değeri burada belirtmeliyiz . Yoksa sınırsız oluşturur.
        itemBuilder: (context, index) {
          return Card(
            color: index % 2 == 0 ? Colors.redAccent : Colors.blueAccent,
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(tumOgrenciler[index]._isim),
              subtitle: Text(tumOgrenciler[index]._aciklama),
              trailing: Icon(Icons.add_call),
              onTap: () {
                //listede tek tıkla eleman seçildiğinde çalışacaka kısım.
                debugPrint(
                    "tek tık basılan eleman $index"); // tumOgrenciler[index] diyerek de direkt olarak yazdırabiliriz.
                toastMesajGoster(index, false);
                alertDialogGoster(context, index);
              },
              onLongPress: () {
                //uzun basıldığında çalışacak kısım.
                debugPrint("uzun basılan eleman $index");
                toastMesajGoster(index, true);
              },
            ),
          );
        });
  }

  void ogrenciVerileriniGetir() {
    tumOgrenciler = List.generate(
        100,
        (index) => Ogrenci("Öğrenci $index adı", "Öğrenci $index açıklaması",
            index % 2 == 0 ? true : false));
  }

  void toastMesajGoster(int index, bool isUzunBasilma) {
    Fluttertoast.showToast(
        msg: isUzunBasilma
            ? "Uzun basıldı" + tumOgrenciler[index].toString()
            : "tek tıklama" + tumOgrenciler[index].toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: index % 2 == 0 ? Colors.redAccent : Colors.blueAccent,
        textColor: Colors.white);
  }

  void alertDialogGoster(BuildContext ctx,int indx) {
    showDialog(
        context: ctx,
        barrierDismissible: false,
        //alertdialog dışına tıklanınca kapansın mı kapanmasın mı onu belirler
        builder: (ctx) {
          return AlertDialog(
            title: Text("Alert d,alog header"),
            content: SingleChildScrollView(//ekrana sığmayacağını düşündüğümüz elemanlarımız varsa bunu kullanarak scroll özelliği kazandırabiliriz.
              child: ListBody(
                children: <Widget>[
                  Text("Öğrenci adı: ${tumOgrenciler[indx]._isim} "),
                  Text("Öğrenci açıklama: ${tumOgrenciler[indx]._aciklama} "),
                  Text("Öğrenci cinsiyet: ${tumOgrenciler[indx]._cinsiyet?"kadın":"erkek"} "),

                ],
              )
            ),
            actions: <Widget>[
              ButtonBar(
                //birden fazla buton olunca burada tutmamız daha sağlıklı olur.
                children: <Widget>[
                  FlatButton(
                    child: Text("Tamam"),
                    onPressed: () {
                      Navigator.of(ctx).pop();//alertdialog'u kapatır.
                    },
                  ),
                  RaisedButton(
                    child: Text("Kapat"),
                    color: Colors.redAccent,
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                  )
                ],
              ),
              //tamam, kapat, iptal gbi aksiyonları burada belirtebiliriz
            ],
          );
        });
  }
} //class sonu

class Ogrenci {
  String _isim;
  String _aciklama;
  bool _cinsiyet;

  Ogrenci(this._isim, this._aciklama, this._cinsiyet);

  @override
  String toString() {
    return "Seçilen öğrenci adı: $_isim , açıklaması:$_aciklama ";
  }
}
