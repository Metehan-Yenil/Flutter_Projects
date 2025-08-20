import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/ui/cubit/kayit_cubit.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repository.dart';
class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("kayıt sayfası"),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
            child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(controller: tfKisiAdi,decoration: const InputDecoration(hintText: "kişi adı"),),
                TextField(controller: tfKisiTel,decoration: const InputDecoration(hintText: "kişi teli"),),
                ElevatedButton(onPressed:(){
                  context.read<KayitCubit>().kaydet(tfKisiAdi.text, tfKisiTel.text);
                }, child: const Text("Kaydet"))
              ],
            )
        )

      ),

    );
  }
}
