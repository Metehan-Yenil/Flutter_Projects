import 'package:cinema_app/data/entity/filmler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema_app/data/repo/filmlerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Filmler>> {
  AnasayfaCubit() : super(<Filmler>[]);
  var filmlerepo= FilmlerdaoRepository();


  Future<void> filmYukle() async{
    var liste = await filmlerepo.filmYukle();

    emit(liste);


  }
}