import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
class KisilerDaoRepostitory{

  Future<void> kaydet(String kisi_ad,String kisi_tel) async {
    print("Kişi Adı: $kisi_ad - Kişi Tel: $kisi_tel");
  }

  void guncelle(int kisi_id, String ad, String tel) {

    print("Güncellendi: $kisi_id, $ad, $tel");

  }

  Future<void> sil(int kisi_id) async {
    print("kisi siliniyor $kisi_id");
  }

  Future<List<Kisiler>> kisileriYukle() async {
    var kisilerListesi = <Kisiler>[];
    var kisi1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "123456789");
    var kisi2 = Kisiler(kisi_id: 2, kisi_ad: "Mehmet", kisi_tel: "987654321");
    var kisi3 = Kisiler(kisi_id: 3, kisi_ad: "Ayşe", kisi_tel: "555555555");
    kisilerListesi.add(kisi1);
    kisilerListesi.add(kisi2);
    kisilerListesi.add(kisi3);
    return kisilerListesi;
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async {
    var kisilerListesi = <Kisiler>[];
    var kisi1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "123456789");

    kisilerListesi.add(kisi1);

    return kisilerListesi;
  }

}