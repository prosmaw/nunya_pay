import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../dark_mode_provider.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Profile",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(180)),
                    child: SvgPicture.asset(
                        "assets/icons/avatar-portrait-svgrepo-com.svg"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Prosper AMEBE",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Prosperamebe@gmail.com",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Paramètre de compte"),
              const SizedBox(
                height: 15,
              ),
              const ProfileParameter(
                icon: Icons.person_outline,
                parameterName: 'Modifier le profil',
              ),
              const SizedBox(
                height: 10,
              ),
              const ProfileParameter(
                icon: Icons.remember_me_outlined,
                parameterName: "Numero d'identification",
                idOrkey: "128466097468",
              ),
              const SizedBox(
                height: 10,
              ),
              const ProfileParameter(
                icon: Icons.key_outlined,
                parameterName: 'Clé API',
                idOrkey: "19289dhue0ojajy6ej9",
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Paramètre de l'application"),
              const SizedBox(
                height: 15,
              ),
              const AppParameter(
                  icon: Icons.notifications, text: 'notification'),
              const SizedBox(
                height: 10,
              ),
              AppParameter(
                icon: Icons.sunny,
                text: "Activer le mode sombre",
                switchVal: ref.watch(darkModeProvider),
                onSwitch: (val) {
                  ref.read(darkModeProvider.notifier).toggle();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileParameter extends StatelessWidget {
  final IconData icon;
  final String parameterName;
  final String idOrkey;
  const ProfileParameter({
    Key? key,
    required this.icon,
    required this.parameterName,
    this.idOrkey = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 233, 228, 228)))),
      child: Row(
        children: <Widget>[
          Icon(icon),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                parameterName,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                idOrkey,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppParameter extends ConsumerWidget {
  final IconData icon;
  final String text;
  final bool switchVal;
  final Function(bool)? onSwitch;
  const AppParameter(
      {Key? key,
      required this.icon,
      required this.text,
      this.onSwitch,
      this.switchVal = false})
      : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 233, 228, 228)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Switch(value: switchVal, onChanged: onSwitch),
        ],
      ),
    );
  }
}
