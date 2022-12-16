import 'package:bilgitesti/sabitler.dart';
import 'package:bilgitesti/sorubankasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('BİLGİ TESTİ'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({super.key});

  @override
  State<SoruSayfasi> createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> dogrular = [];
  List<Widget> yanlislar = [];

  Testler test1 = Testler();

  void butonFonsiyonu(bool sonuc) {
    if (test1.sonSoru() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(
              "!! TEST BİTTİ  !!",
              textAlign: TextAlign.center,
            ),
            content: new Text(
                'Doğru Sayısı:${dogrular.length} \nYanlış Sayısı:${yanlislar.length}'),
            actions: <Widget>[
              new TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: new Text(
                  "TEKRAR DENE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    test1.yenidenBaslat();
                    dogrular = [];
                    yanlislar = [];
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        test1.getirSoruCevabi() == sonuc
            ? dogrular.add(kdogruiconu)
            : yanlislar.add(kyanlisiconu);
        test1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test1.getirSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: dogrular,
        ),
        SizedBox(
          height: 5,
        ),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: yanlislar,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        butonFonsiyonu(false);
                      },
                      child: Icon(
                        Icons.thumb_down,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        setState(() {
                          butonFonsiyonu(true);
                        });
                      },
                      child: Icon(
                        Icons.thumb_up,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
