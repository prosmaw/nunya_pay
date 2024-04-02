import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailHistorique extends StatelessWidget {
  final String etat;
  final String operateur;
  final String montant;
  final String icon;
  final String heure;
  const DetailHistorique({
    Key? key,
    required this.etat,
    required this.operateur,
    required this.montant,
    required this.icon,
    required this.heure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(180)),
              child: SvgPicture.asset(
                icon,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(etat, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  heure,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(montant, style: Theme.of(context).textTheme.displayMedium),
            Text(operateur, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ],
    );
  }
}
