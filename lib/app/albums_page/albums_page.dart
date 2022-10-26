import 'package:blow_shot/app/swiper_view_demo/sairi_swiped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/auth_service.dart';
import '../components/app_colors.dart';
import '../components/base_app_bar.dart';
import '../components/page_back_ground.dart';
import 'widgets/one_year.dart';

class AlbumsPage extends ConsumerWidget {
  const AlbumsPage({super.key});
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text("私のあるばむ"),
        color: Colors.purple,
        widgets: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
                onPressed: () {
                  ref.watch(authServiceProvider).logOut();
                },
                icon: const Icon(Icons.logout_outlined)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: PageBackGround(
            colors: const [
              Color.fromARGB(161, 222, 14, 245),
              AppColors.secondary
            ],
            page: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Text(
                    "月　一覧",
                    style:
                        TextStyle(fontSize: 40.0, color: AppColors.secondary),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  mainAxisSpacing: 30.0,
                  crossAxisCount: 3,
                  children: months,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: MaterialButton(
                    child: const Text("sairi photos"),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const SairiSwiped();
                      }));
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
