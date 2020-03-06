import 'package:flutter/material.dart';
import '../models/medicamento.dart';

class Medicamentos extends StatelessWidget {

  List<Medicamento> medList = [];

  populateMedList() {
    for (int item = 0; item<15; item++) {
      medList.add(Medicamento(name: 'Acebutolol ['+ item.toString() +']', description: 'Antiarrítimico e Anti-hipertensivo'));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (medList.isEmpty) {
      print("populating medList");
      populateMedList();
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Pesquisar por Medicamento",
                ),
              ),
            ),
          ),
          Container(
            height: 540,
            child: ListView.separated(
              itemCount: medList.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  title: Text(medList[index].name),
                  subtitle: Text(medList[index].description),
                  trailing: IconButton(icon: Icon(Icons.star_border), color: Colors.orangeAccent, onPressed: () { print("setFavorite \"" + medList[index].name + "\""); }),
                  onTap: () { Navigator.pushNamed(context, '/med_info'); },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}