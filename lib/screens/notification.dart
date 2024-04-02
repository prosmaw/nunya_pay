import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Notifications",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              const NouvelleNotif(),
              const SizedBox(
                height: 20,
              ),
              const AncienNotif()
            ],
          ),
        ),
      ),
    );
  }
}

//ancienne notification affiche ce qui est dans la base de données
class AncienNotif extends StatelessWidget {
  const AncienNotif({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "ANCIENNES NOTIFICATIONS",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 12),
        ),
        const SizedBox(
          height: 20,
        ),
        const DetailNotif(
          message: "Vous avez reçu 10.000 Par Flooz",
          noticon: "assets/icons/recu.svg",
          temps: '15 minutes',
        )
      ],
    );
  }
}

//Nouvelle notification sauvegarde dans la base de données

class NouvelleNotif extends StatelessWidget {
  const NouvelleNotif({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "NOUVELLES NOTIFICATIONS",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 12),
        ),
        const SizedBox(
          height: 20,
        ),
        const DetailNotif(
          message: "Vous avez retiré 20.000 Par Tmoney",
          noticon: "assets/icons/retrait.svg",
          temps: '10 minutes',
        )
      ],
    );
  }
}

class DetailNotif extends StatelessWidget {
  final String noticon;
  final String message;
  final String temps;
  const DetailNotif({
    super.key,
    required this.noticon,
    required this.message,
    required this.temps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(180)),
          child: SvgPicture.asset(noticon),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message,
              style:
                  Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Il y a $temps",
              style: const TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}
