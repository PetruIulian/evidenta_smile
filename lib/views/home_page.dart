import 'package:evidenta_smile/utils/googlesheets.dart';
import 'package:evidenta_smile/utils/sheetscolumns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  List<Voluntar> voluntari;
  HomePage(this.voluntari, {super.key});

  @override
  State<HomePage> createState() => _HomePageState(voluntari);
}

class _HomePageState extends State<HomePage> {
  List<Voluntar> voluntari;
  _HomePageState(this.voluntari);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetVoluntari = <Widget>[];
    voluntari.forEach((element) {
      widgetVoluntari.add( InkWell(
        onTap: (){
          showDialog(context: context, builder: (_) => AlertDialog(
            title: Center(child: Text('${element.nume}')),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Ianuarie: ${element.ianuarie}'),
                SizedBox(height: 5),
                Text('Februarie: ${element.februarie}'),
                SizedBox(height: 5),
                Text('Martie: ${element.martie}'),
                SizedBox(height: 5),
                Text('Aprilie: ${element.aprilie}'),
                SizedBox(height: 5),
                Text('Mai: ${element.mai}'),
                SizedBox(height: 5),
                Text('Iunie: ${element.iunie}'),
                SizedBox(height: 5),
                Text('Iulie: ${element.iulie}'),
                SizedBox(height: 5),
                Text('August: ${element.august}'),
                SizedBox(height: 5),
                Text('Septembrie: ${element.septembrie}'),
                SizedBox(height: 5),
                Text('Octombrie: ${element.octombrie}'),
                SizedBox(height: 5),
                Text('Noiembrie: ${element.noiembrie}'),
                SizedBox(height: 5),
                Text('Decembrie: ${element.decembrie}'),
              ],
            ),));
        },
        child: Card(
          elevation: 20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 10,),
              Text('${element.nume}'),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Prezente Sedinta ${element.prezente}/10'),
                  SizedBox(width: 60,),
                  Text('Prezente Proiect -/10'),
                ],
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ));
    });

    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: <SpeedDialChild>[
          SpeedDialChild(
            child: const Icon(Icons.accessibility_new_rounded),
            label: 'Adauga Voluntar',
          ),
          SpeedDialChild(
            child: const Icon(Icons.access_alarm),
            label: 'Adauga Sedinta',
          ),
          SpeedDialChild(
            child: const Icon(Icons.account_tree_outlined),
            label: 'Adauga Proiect',
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppBar(
                    title: const Center(child: Text('Evidenta Smile Sibiu')),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                    child: Image.asset('assets/logo.png', height: 200, width: 200,),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: widgetVoluntari,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }

}
