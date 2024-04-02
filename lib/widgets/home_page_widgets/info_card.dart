import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoCard extends StatelessWidget {
  final String solde;
  final String numerdoId;
  const InfoCard({
    Key? key,
    required this.solde,
    required this.numerdoId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff1f005c),
            //Color.fromARGB(255, 37, 37, 37),
            Color(0xff1f005c),
            Color.fromARGB(255, 65, 64, 64),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/icons/overlap-features-svgrepo-com.svg",
                  height: 45,
                  color: Colors.white,
                ),
                SvgPicture.asset(
                  "assets/icons/dot3.svg",
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Solde",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            Text(
              solde,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Numéro d'identification",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Text(
                  numerdoId,
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
    );
  }
}
