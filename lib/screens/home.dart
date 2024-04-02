import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nunya_pay_app/screens/account_screen.dart';

import 'home_page.dart';
import 'notification.dart';

var indexProvider = StateProvider<int>((ref) => 0);

// ignore: must_be_immutable
class Home extends ConsumerWidget {
  Home({super.key});

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: ref.watch(indexProvider),
        children: const [HomePage(), NotificationPage(), AccountScreen()],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
        decoration: const BoxDecoration(
            //color: Colors.transparent,
            ),
        child: CustomNavigationBar(
            onTap: (index) {
              // ignore: deprecated_member_use
              ref.read(indexProvider.state).state = index;
            },
            currentIndex: ref.watch(indexProvider),
            backgroundColor: const Color.fromARGB(255, 92, 34, 232),
            isFloating: true, //rendre la bar flottante
            bubbleCurve: Curves.linear,
            blurEffect: true,
            unSelectedColor: Colors.white,
            borderRadius: const Radius.circular(20),
            items: [
              CustomNavigationBarItem(
                icon: const Icon(Icons.home),
                title: const Text(
                  "Acceuil",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              CustomNavigationBarItem(
                  icon: const Icon(Icons.notifications),
                  title: const Text(
                    "Notification",
                    style: TextStyle(color: Colors.white),
                  )),
              CustomNavigationBarItem(
                  icon: const Icon(Icons.account_circle),
                  title: const Text(
                    "Compte",
                    style: TextStyle(color: Colors.white),
                  )),
            ]),
      ),
    );
  }
}
