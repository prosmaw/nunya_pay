import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/home_page_widgets/detail_historique.dart';
import '../widgets/home_page_widgets/info_card.dart';
import 'operationhistorique.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Message de bienvenu et profil
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Bonjour, \nProsper AMEBE",
                      style: Theme.of(context).textTheme.headline2
                      //style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(180)),
                    child: SvgPicture.asset(
                        "assets/icons/avatar-portrait-svgrepo-com.svg"),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              //Solde
              Text("Solde total",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline5),
              const SizedBox(
                height: 10,
              ),
              Text("300.000 FCFA",
                  style: Theme.of(context).textTheme.headline1),
              const SizedBox(
                height: 30,
              ),
              //Carte solde retiré et identifiant
              const InfoCard(
                numerdoId: '0000112567',
                solde: '50.000 FCFA',
              ),
              const SizedBox(
                height: 10,
              ),
              //demande de retrait
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 92, 34, 232),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: const Size(255, 50)),
                  onPressed: () {
                    const Dialog(
                      child: Column(
                        children: <Widget>[Text("Retrait")],
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.output),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Demande de retrait",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 3,
              ),
              const SizedBox(
                height: 40,
              ),
              //historique
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Recent", style: Theme.of(context).textTheme.headline2),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Historique()),
                      );
                    },
                    child: const Text(
                      "Tout voir",
                      style: TextStyle(
                          color: Color.fromARGB(255, 92, 34, 232),
                          fontSize: 22),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Column(
                children: <Widget>[
                  DetailHistorique(
                    etat: 'Reçu',
                    icon: "assets/icons/recu.svg",
                    montant: '20.000',
                    operateur: 'Tmoney',
                    heure: '13:20',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DetailHistorique(
                    etat: 'Envoie',
                    icon: "assets/icons/envoie.svg",
                    montant: '15.000',
                    operateur: 'Flooz',
                    heure: '12:00',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DetailHistorique(
                    etat: 'Retrait',
                    icon: "assets/icons/retrait.svg",
                    montant: '12.000',
                    operateur: 'Tmoney',
                    heure: '11:16',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DetailHistorique(
                    etat: 'Envoie',
                    icon: "assets/icons/envoie.svg",
                    montant: '25.000',
                    operateur: 'Flooz',
                    heure: '10:10',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
