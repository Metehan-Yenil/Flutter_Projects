import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmler_uygulamasi_firestore/data/entity/filmler.dart';
import 'package:filmler_uygulamasi_firestore/data/repo/filmlerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Filmler>> {
  AnasayfaCubit():super(<Filmler>[]);

  var frepo = FilmlerDaoRepository();
  var collectionFilmler = FirebaseFirestore.instance.collection("Filmler");



  Future<void> filmleriYukle() async {
    collectionFilmler.get().then((value)
    {
      var filmlerListesi = <Filmler>[];
      var docs = value.docs;
      for (var doc in docs){
        var key = doc.id;
        var data = doc.data();
        var film = Filmler.fromJson(data, key);
        filmlerListesi.add(film);
      }
      emit(filmlerListesi);
    });

  }
}