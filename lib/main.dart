import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
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
        body: Column(
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
                          FadeInImage.assetNetwork(placeholder: "assets/images/loading.gif", image: "http://hdqwalls.com/wallpapers/small-memory-lp.jpg"),
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
                          FlutterLogo(size:60, colors: Colors.lightGreen, style:FlutterLogoStyle.horizontal),
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
                            child: Placeholder(color: Colors.red, strokeWidth: 2.0),
                          ),
                          Text("Placeholder widget"),
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),
            Column(),
          ],
        ),
      ),
    ),
  );
}
