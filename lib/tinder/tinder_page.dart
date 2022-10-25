import 'package:blow_shot/tinder/components/build_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/components/app_colors.dart';
import '../app/components/base_app_bar.dart';
import '../app/components/page_back_ground.dart';

class TinderPage extends ConsumerWidget {
  const TinderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: const BaseAppBar(
            title: Text("てぃんだー"),
            widgets: [],
            color: Color.fromARGB(194, 240, 15, 90)),
        body: PageBackGround(
            colors: const [
              Color.fromARGB(194, 235, 101, 146),
              AppColors.secondary
            ],
            page: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const BuildCards(),
            )));
  }
}
