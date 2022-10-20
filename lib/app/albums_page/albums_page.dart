import 'package:blow_shot/app/albums_page/widgets/one_year.dart';
import 'package:flutter/material.dart';

import '../components/page_back_ground.dart';

class AlbumsPage extends StatelessWidget {
  const AlbumsPage({super.key});
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        child: PageBackGround(
            colors: const [
              Color.fromARGB(162, 233, 72, 251),
              Color.fromARGB(230, 55, 1, 74)
            ],
            page: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "私のあるばむ",
                  style: TextStyle(fontSize: 40.0),
                ),
                GridView.count(
                  shrinkWrap: true,
                  mainAxisSpacing: 30.0,
                  crossAxisCount: 3,
                  children: months,
                ),
              ],
            )),
      ),
    );
  }
}
