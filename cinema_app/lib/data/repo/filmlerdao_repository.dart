import 'package:cinema_app/data/entity/filmler.dart';

class FilmlerdaoRepository {

  Future<List<Filmler>> filmYukle() async{
    var filmlerListesi = <Filmler>[];
    var f1 = Filmler(ad: "Anadoluda", id: 1, resim: "anadoluda.png", fiyat: 50);
    var f2 = Filmler(ad: "Django", id: 2, resim: "django.png", fiyat: 60);
    var f3 = Filmler(ad: "Inception", id: 3, resim: "inception.png", fiyat: 70);
    var f4 = Filmler(ad: "Interstellar", id: 4, resim: "interstellar.png", fiyat: 70);
    var f5 = Filmler(ad: "The hateful eight", id: 5, resim: "thehatefuleight.png", fiyat: 70);
    var f6 = Filmler(ad: "The Pianist", id: 6, resim: "thepianist.png", fiyat: 70);

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);

    return filmlerListesi;
  }

}