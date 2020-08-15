import 'package:flutter/material.dart';

class ResimVeButonTurleri extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Image ve Buton Türleri",
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FadeInImage.assetNetwork(
                          placeholder: "assets/images/loading.gif",
                          image:
                          "http://hdqwalls.com/wallpapers/small-memory-lp.jpg"),
                      Text("FadeinImage"),
                    ],
                  ),
                  color: Colors.amber,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      //uygulamamıza internetten görsel çekmek için kullanabiliriz.
                      Image.network(
                          "http://hdqwalls.com/wallpapers/small-memory-lp.jpg"),
                      Text(
                        "Network Image",
                      ),
                    ],
                  ),
                  color: Colors.amber,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                        AssetImage("assets/images/hekaicon.jpg"),
                        //resim koymak için ana sıfları kullanıyoruz. AssetImage veya NetworkImage kullanabiliriz.
                        //backgroundImage: NetworkImage("resim linki")
//                        //daire içinde text göstermek için aşağıdaki kullanım
//                        child: Text("Heka"),
//                        backgroundColor: Colors.purple,
//                        foregroundColor: Colors.white,
                      ),
                      Text(
                        "Circle avatar",
                      ),
                    ],
                  ),
                  color: Colors.amber,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                ),
              ),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlutterLogo(
                          size: 60,
                          colors: Colors.lightGreen,
                          style: FlutterLogoStyle.horizontal),
                      Text("Flutter Logo"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //tam olarak tamamlanmamış bir arayüz geliştirirken oraya birşey gelecek anlamındadır.
                      Expanded(
                        child: Placeholder(
                            color: Colors.red, strokeWidth: 2.0),
                      ),
                      Text("Placeholder widget"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text("Hasan K"),
                color: Colors.orange,
                onPressed: () => debugPrint("heka clicked!"),
              ),
              RaisedButton(
                child: Text("Flutter lesson3"),
                elevation: 10,
                color: Colors.yellow,
                onPressed: () {
                  debugPrint("lesson name clicked!");
                },
              ),
              RaisedButton(
                child: Text("Uzun method"),
                elevation: 10,
                color: Colors.redAccent,
                onPressed: () {
                  debugPrint("lesson name clicked2!");
                  uzunMethod();
                },
              ),
              RaisedButton(
                child: Text("Onclick Örneği3"),
                elevation: 10,
                color: Colors.blue,
                onPressed: uzunMethod,
              ),
              IconButton(icon: Icon(Icons.add, size: 32,), onPressed: (){},),
              FlatButton(onPressed: (){}, child: Text("Flat Button Example", style: TextStyle(fontSize: 24),)),//sadece yazıdan oluşan butondur.
            ],
          ),
        ),
      ],
    );
  }

}

void uzunMethod() {
  debugPrint("Uzun method çalıştı! #00000111122");
}