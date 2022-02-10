import 'package:flutter/material.dart';

class HorizontalLinee extends StatelessWidget {
  const HorizontalLinee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('0% completed'),
            Container(
              width: width(313),
              height: height(14),
              decoration: BoxDecoration(
                color: const Color(0xffE8DEEB),
                border: Border.all(
                  color: const Color(0xff6E75A0),
                  width: 1,
                ), //Border.all
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
