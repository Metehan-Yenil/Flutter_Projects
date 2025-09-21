import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmler_uygulamasi_firestore/data/entity/filmler.dart';
import 'package:filmler_uygulamasi_firestore/ui/cubit/anasayfa_cubit.dart';
import 'package:filmler_uygulamasi_firestore/ui/views/detay_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().filmleriYukle();

    var collectionFilmler= FirebaseFirestore.instance.collection("Filmler");
    var f1 = {"id": "","ad": "Django", "resim": "django.png", "fiyat": 30};
    var f2 = {"id": "","ad": "Inception", "resim": "inception.png", "fiyat": 25};
    var f3 = {"id": "","ad": "Interstellar", "resim": "interstellar.png", "fiyat": 40};
    var f4 = {"id": "", "ad": "The Hateful Eight", "resim": "thehatefuleight.png", "fiyat": 35};
    var f5 = {"id": "", "ad": "The Pianist", "resim": "thepianist.png", "fiyat": 20};
    var f6= {"id": "", "ad": "Anadoluda", "resim": "anadoluda.png", "fiyat": 15};
    collectionFilmler.add(f1);
    collectionFilmler.add(f2);
    collectionFilmler.add(f3);
    collectionFilmler.add(f4);
    collectionFilmler.add(f5);
    collectionFilmler.add(f6);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filmler"),),
      body: BlocBuilder<AnasayfaCubit,List<Filmler>>(
        builder: (context,filmlerListesi){
          if(filmlerListesi.isNotEmpty){
            return GridView.builder(
              itemCount: filmlerListesi.length,//6
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,childAspectRatio: 1 / 1.8
              ),
              itemBuilder: (context,indeks){//0,1,2,3,4,5
                var film = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film)));
                  },
                  child: Card(
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network("http://kasimadalan.pe.hu/filmler_yeni/resimler/${film.resim}"),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${film.fiyat} ₺",style: const TextStyle(fontSize: 24),),
                            ElevatedButton(onPressed: (){
                              print("${film.ad} sepete eklendi");
                            }, child: const Text("Sepet"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
    );
  }
}
