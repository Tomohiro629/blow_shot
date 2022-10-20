import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/page_back_ground.dart';

class MonthPhotoPage extends ConsumerWidget {
  const MonthPhotoPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
          child: PageBackGround(
              colors: const [
            Color.fromARGB(255, 72, 251, 227),
            Color.fromARGB(230, 1, 74, 72)
          ],
              page: Column(
                children: <Widget>[Container()],
              ))),
    );
  }
}
