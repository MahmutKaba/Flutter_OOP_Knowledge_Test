import 'package:bilgitesti/sorutipi.dart';

class Testler {
  int _soruNumarasi = 1;
  final List<SoruTipi> _sorular = [
    SoruTipi(soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir', cevap: false),
    SoruTipi(
        soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
        cevap: true),
    SoruTipi(soruMetni: 'Kelebeklerin ömrü bir gündür', cevap: false),
    SoruTipi(soruMetni: 'Dünya düzdür', cevap: false),
    SoruTipi(
        soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır', cevap: true),
    SoruTipi(
        soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir', cevap: true),
    SoruTipi(soruMetni: 'Fransızlar 80 demek için, 4 - 20 der', cevap: true),
    SoruTipi(soruMetni: 'Test Bitti', cevap: true),
  ];

  String getirSoruMetni() {
    return _sorular[_soruNumarasi - 1].soruMetni;
  }

  bool getirSoruCevabi() {
    return _sorular[_soruNumarasi - 1].cevap;
  }

  void sonrakiSoru() {
    _soruNumarasi < _sorular.length ? _soruNumarasi++ : () {};
  }

  bool sonSoru() {
    if (_soruNumarasi >= _sorular.length) {
      return true;
    } else {
      return false;
    }
  }

  void yenidenBaslat() {
    _soruNumarasi = 1;
  }
}
