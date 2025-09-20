import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisiler_uygulamasi_firestore/data/entity/kisiler.dart';

class KisilerDaoRepository {
  var collectionKisiler= FirebaseFirestore.instance.collection("Kisiler");


  Future<void> kaydet(String kisi_ad,String kisi_tel) async {
  var yeniKisi = HashMap<String,dynamic>();
  yeniKisi["kisi_ad"]=kisi_ad;
  yeniKisi["kisi_tel"]=kisi_tel;
  await collectionKisiler.add(yeniKisi);

  }

  Future<void> guncelle(String kisi_id,String kisi_ad,String kisi_tel) async {
  var guncellenecekKisi= HashMap<String,dynamic>();
  guncellenecekKisi["kisi_ad"]=kisi_ad;
  guncellenecekKisi["kisi_tel"]=kisi_tel;
  await collectionKisiler.doc(kisi_id).update(guncellenecekKisi);

  }

  Future<void> sil(String kisi_id) async {
  await collectionKisiler.doc(kisi_id).delete();
  }
}