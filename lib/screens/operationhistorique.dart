import 'package:flutter/material.dart';
import '../widgets/home_page_widgets/detail_historique.dart';
import 'home.dart';

class Historique extends StatelessWidget {
  const Historique({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                icon: const Icon(Icons.arrow_back)),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Aujourd'hui",
              style:
                  Theme.of(context).textTheme.headline4?.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            ),
            const DetailHistorique(
              etat: 'Reçu',
              icon: "assets/icons/recu.svg",
              montant: '20.000',
              operateur: 'Tmoney',
              heure: '13:20',
            ),
            const SizedBox(
              height: 10,
            ),
            const DetailHistorique(
              etat: 'Envoie',
              icon: "assets/icons/envoie.svg",
              montant: '15.000',
              operateur: 'Flooz',
              heure: '12:00',
            ),
            const SizedBox(
              height: 10,
            ),
            const DetailHistorique(
              etat: 'Retrait',
              icon: "assets/icons/retrait.svg",
              montant: '12.000',
              operateur: 'Tmoney',
              heure: '11:16',
            ),
            const SizedBox(
              height: 10,
            ),
            const DetailHistorique(
              etat: 'Envoie',
              icon: "assets/icons/envoie.svg",
              montant: '25.000',
              operateur: 'Flooz',
              heure: '10:10',
            )
          ],
        ),
      )),
    );
  }
}
