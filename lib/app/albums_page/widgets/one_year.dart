import 'package:blow_shot/app/components/app_colors.dart';
import 'package:blow_shot/service/common_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../month_photo_page/month_photo_page.dart';

class OneYear extends StatelessWidget {
  const OneYear({
    Key? key,
    required this.month,
  }) : super(key: key);
  final int month;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 14.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Stack(children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: month.toString() == getMonthString(DateTime.now())
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color.fromARGB(172, 255, 8, 111),
                  ),
                  child: Center(
                    child: Text(
                      "${month.toString()}月",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    "${month.toString()}月",
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
        ),
        Ink(
          child: InkWell(
            splashColor: const Color.fromARGB(119, 243, 77, 255),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const MonthPhotoPage();
                  },
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

List<OneYear> months = const [
  OneYear(month: 1),
  OneYear(month: 2),
  OneYear(month: 3),
  OneYear(month: 4),
  OneYear(month: 5),
  OneYear(month: 6),
  OneYear(month: 7),
  OneYear(month: 8),
  OneYear(month: 9),
  OneYear(month: 10),
  OneYear(month: 11),
  OneYear(month: 12),
];
