import 'package:flutter/material.dart';
import 'package:urunler/data/entity/urunler.dart';
import 'package:urunler/ui/detay_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Urunler>> urunleriYukle() async{
    var urunlerListesi = <Urunler>[];
    var u1 = Urunler(id: 1, ad: "Macbook", resim: "bilgisayar.png", fiyat: 50000);
    var u2= Urunler(id: 2, ad: "Gozluk", resim: "gozluk.png", fiyat: 2000);
    var u3 = Urunler(id: 3, ad: "Kulaklık", resim: "kulaklik.png", fiyat: 30000);
    var u4 = Urunler(id: 4, ad: "Parfum", resim: "parfum.png", fiyat: 15000);
    var u5 = Urunler(id: 5, ad: "Saat", resim: "saat.png", fiyat: 25000);
    var u6 = Urunler(id: 6, ad: "Telefon", resim: "telefon.png", fiyat: 40000);
    var u7 = Urunler(id: 7, ad: "Supurge", resim: "supurge.png", fiyat: 40000);
    urunlerListesi.add(u1);
    urunlerListesi.add(u2);
    urunlerListesi.add(u3);
    urunlerListesi.add(u4);
    urunlerListesi.add(u5);
    urunlerListesi.add(u6);
    urunlerListesi.add(u7);
    return urunlerListesi;

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Ürünler'),

      ),
      body: FutureBuilder<List<Urunler>>(
        future: urunleriYukle(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            var urunler = snapshot.data!;
            
              return ListView.builder(
                itemCount: urunler!.length,
                itemBuilder: (context, index){ //0,1,2
                  var urun = urunler[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(urun: urun)));
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(width: 128, height: 128,
                                child: Image.asset("resimler/${urun.resim}", width: 100, height: 100,)),
                          ),
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(urun.ad),
                              const SizedBox(height: 8,),
                            Text("${urun.fiyat}₺", style: const TextStyle(fontSize: 20, color: Colors.black54),),
                            const SizedBox(height: 6,),
                            ElevatedButton(onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${urun.ad} sepete eklendi!"))
                              );
                            }, child: const Text("Sepete Ekle") ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );


                },
              );

          }
          else {
            return const Center();

          }

        },
      ),
    );
  }
}
