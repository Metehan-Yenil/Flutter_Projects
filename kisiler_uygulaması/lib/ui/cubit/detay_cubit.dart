import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repository.dart';

class DetayCubit extends Cubit<void> {
  DetayCubit() : super(0);
  var krepo = KisilerDaoRepostitory();

  void guncelle(int kisi_id, String ad, String tel) {
    krepo.guncelle(kisi_id, ad, tel);
  }
  // This class can be used
}