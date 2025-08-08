import 'package:flutter/material.dart';
import 'package:taskly_anasayfa/profil.dart';
import 'package:taskly_anasayfa/calendar.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final Function(int)? onTabSelected;

  const MainScaffold({
    super.key,
  required this.body,
  this.selectedIndex = 0,
  this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 18,
                        offset: Offset(0, 4),
                      )
                    ]
                ),
                child: IconButton(
                  icon: Icon(Icons.home, color: Colors.deepPurple),
                  onPressed: (){

                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.calendar_today, color: Colors.deepPurple),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Calendar()));
                },
              ),
              SizedBox(width: 40),
              IconButton(
                icon: Icon(Icons.description,
                    color: Colors.deepPurple),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.deepPurple),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const Profil()));
                },
              ),

            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.4),
                spreadRadius: 6,
                blurRadius: 18,
                offset: Offset(0, 8),
              )
            ]
        ),
        clipBehavior: Clip.hardEdge,
        child: FloatingActionButton(onPressed: (){},
          child: Icon(Icons.add,color: Colors.white,),
          backgroundColor: Colors.deepPurple,
          elevation: 0,

        ),
      ),
    );
  }
}
