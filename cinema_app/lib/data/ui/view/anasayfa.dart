import 'package:cinema_app/data/entity/filmler.dart';
import 'package:cinema_app/data/ui/cubits/anasayfa_cubit.dart';
import 'package:cinema_app/data/ui/view/detay_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}


class _AnasayfaState extends State<Anasayfa> {

  int calismaSayaci = 0;


  Future<void> calistirmaSayac() async {
    var prefs = await SharedPreferences.getInstance();
    calismaSayaci= (prefs.getInt("calismaSayaci") ?? 0)+1;
    await prefs.setInt("calismaSayaci", calismaSayaci);
    print("bu uygulama toplamda $calismaSayaci kere çalıştırıldı");

  }
  @override
  void initState() {
    super.initState();
    //Cubit i başlatıyoruz
    context.read<AnasayfaCubit>().filmYukle();
    calistirmaSayac();




  }
  /*Future<List<Filmler>> filmYukle() async{
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
*/  //Block Pattern ile bu fonksiyonu repository e taşdık cubit ile çağıracağız.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anasayfa '),
        centerTitle: true,
      ),
      body: BlocBuilder<AnasayfaCubit, List<Filmler>>(
        builder: (context,snapshot) {

                if (snapshot.isNotEmpty) {
                  return GridView.builder(
                    itemCount: snapshot!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1/1.8
                    ),
                    itemBuilder: (context, index){
                      var film = snapshot[index];
                      return GestureDetector(
                        onTap: () {
                          print("${film.ad} tıklandı");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(film)));
                        },
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("resimler/${film.resim}"),
                            Text(film.ad, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Text("${film.fiyat} TL", style: const TextStyle(fontSize: 16, color: Colors.red),),
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      print("${film.ad} eklendi");
                                    },
                                    child: const Text("Sepete Ekle"),
                                  )
                                ],
                              ),
                            )

                          ],
                        )
                      );

                    },
                  );
                }else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }


      )
    );
  }
}
