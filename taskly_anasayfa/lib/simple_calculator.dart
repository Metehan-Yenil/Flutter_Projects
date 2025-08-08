import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var toplam=0;
  var temp;
  final TextEditingController _controller = TextEditingController();

  void _tusaBasildi(int number){
    setState(() {
      _controller.text += number.toString();
    });
  }


  Widget buildNumpad() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: List.generate(10, (index) {
          // 0'ı en alta almak için index == 9 ise 0 yaz
          final number = index == 9 ? 0 : index + 1;
          return ElevatedButton(
            onPressed: () {
              _tusaBasildi(number);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[900],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
            ),
            child: Text(
              '$number',
              style: const TextStyle(fontSize: 24),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
       children: [

             Container(
               margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
                padding: const EdgeInsets.all(16),
               decoration: BoxDecoration(
                 color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
               ),
               child: Row(
                 children: [
                   Expanded(child: Align(
                     alignment: Alignment.centerRight,
                     child: TextField(
                       controller: _controller,
                       readOnly: true,
                       textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                        ),
                       decoration: const InputDecoration(
                         border: InputBorder.none,
                          hintText: '0',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 32,
                          ),

                       ),
                     ),
                   ))
                 ],
               ),
             ),



         buildNumpad(),
         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             ElevatedButton(onPressed: (){
               var sayi = int.tryParse(_controller.text);
                if (sayi != null) {
                  setState(() {
                    toplam = sayi;

                    _controller.text= toplam.toString() + "+";
                  });
                }
             },
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.orange,
                 foregroundColor: Colors.white,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(12),
               ),
                  padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
               ),
               child: const Text(
                 '+',
                 style: TextStyle(fontSize: 24),
               ),
              ),
             ElevatedButton(onPressed: (){

               var parts = _controller.text.split('+');
               var sayi2 = parts.length > 1 ? int.tryParse(parts[1]) : int.tryParse(_controller.text);
               if (sayi2 != null) {
                 setState(() {
                   toplam += sayi2;
                   _controller.clear();
                   _controller.text = toplam.toString();
                 });
               }
             },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.green,
               foregroundColor: Colors.white,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(12),
             ),
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
             ),
              child: const Text(
                '=',
                style: TextStyle(fontSize: 24),
              ),
              ),

             ElevatedButton(onPressed: (){
               setState(() {
                 toplam=0;
                  _controller.clear();
               });
             },
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.green,
                 foregroundColor: Colors.white,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(12),
                 ),
                 padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
               ),
               child: const Text(
                 'C',
                 style: TextStyle(fontSize: 24),
               ),
             ),

           ],
         )
       ],

      ),
    );
  }
}
