import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/ui/view/kayit_sayfa.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/view/detay_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyormu = false;

  Future<void> ara(String aramaKelimesi) async {
    print("Arama yapılıyor: $aramaKelimesi");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyormu
            ? TextField(
          decoration: const InputDecoration(hintText: "Kişi Ara"),
          onChanged: (aramaSonucu) {
            ara(aramaSonucu);
          },
        )
            : const Text("Kisiler"),
        actions: [
          aramaYapiliyormu
              ? IconButton(
              onPressed: () {
                setState(() {
                  aramaYapiliyormu = false;
                });
              },
              icon: const Icon(Icons.cancel))
              : IconButton(
              onPressed: () {
                setState(() {
                  aramaYapiliyormu = true;
                });
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<Kisiler>>(
        future: kisileriYukle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var kisilerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kisilerListesi!.length,
              itemBuilder: (context, index) {
                var kisi = kisilerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  DetaySayfa(kisi: kisi)))
                        .then((value) {
                      print("anasayfaya Geri döndü");
                    });
                  },
                  child: Card(
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(kisi.kisi_ad,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(kisi.kisi_tel,
                                    style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${kisi.kisi_ad} silinsin mi?"),
                                    action: SnackBarAction(label: "evet",
                                        onPressed: (){
                                      sil(kisi.kisi_id);
                                        }),
                                  )
                                );
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.black54,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const KayitSayfa()))
              .then((value) {
            print("anasayfaya Geri döndü");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}