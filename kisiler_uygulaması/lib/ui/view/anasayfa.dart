import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/ui/view/kayit_sayfa.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/view/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/ui/cubit/anasayfa_cubit.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyormu = false;





  initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyormu
            ? TextField(
          decoration: const InputDecoration(hintText: "Kişi Ara"),
          onChanged: (aramaSonucu) {

            context.read<AnasayfaCubit>().ara(aramaSonucu);
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
                context.read<AnasayfaCubit>().kisileriYukle();
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
      body: BlocBuilder<AnasayfaCubit,List<Kisiler>>(
        builder: (context, snapshot) {
          if (snapshot.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.length,
              itemBuilder: (context, index) {
                var kisi = snapshot[index];
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
                                      context.read<AnasayfaCubit>().sil(kisi.kisi_id);
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
            context.read<AnasayfaCubit>().kisileriYukle();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}