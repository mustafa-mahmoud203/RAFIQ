import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/core/components/components.dart';

class HotelWidget extends StatefulWidget {
  const HotelWidget({Key? key}) : super(key: key);

  @override
  State<HotelWidget> createState() => _HotelWidgetState();
}

class _HotelWidgetState extends State<HotelWidget> {
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return SizedBox(
      height: h(700),
      child: Swiper(
        itemBuilder: ((context, index) {
          return Column(
            children: [
              SizedBox(
                //   width: w(300),
                height: h(445),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    "https://media.istockphoto.com/photos/mosque-and-pyramids-picture-id1174818077?k=20&m=1174818077&s=612x612&w=0&h=vAutxzWDTokCJkf6010sguiHP6yc8Nzt8qePG9DEew0=",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: w(345),
                color: const Color(0xffEFE7F2),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: w(15), top: h(13)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          AutoSizeText(
                            'Leaning Tower of Pisa',
                            style: TextStyle(
                              color: Color(0xff5B618A),
                              fontFamily: 'DavidLibre',
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ignore: todo
                    // TODO if text less than one line , it will be in the center
                    Padding(
                      padding: EdgeInsets.only(
                          left: w(12.5),
                          top: h(14),
                          bottom: h(18),
                          right: w(13)),
                      child: AutoSizeText(
                        'Its is one of the most famous leaning towers in the world. It is the bell tower of the Cathedral of Pisa that has been under construction for almost 200 years, owing to a succession of wars as a symbol of the power of the maritime republic',
                        style: TextStyle(
                          color: const Color(0xff5B618A).withOpacity(0.9),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DavidLibre',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w(20), right: w(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildRating(3.5),
                          InkWell(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/city_icons/location.svg'),
                                const AutoSizeText(
                                  'Location',
                                  style: TextStyle(
                                    color: Color(0xff5B618A),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'DavidLibre',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
        itemCount: 2,
        itemWidth: w(320.0),
        itemHeight: h(700.0),
        layout: SwiperLayout.STACK,
        axisDirection: AxisDirection.right,
        onIndexChanged: (index) {},
        onTap: (index) {},
      ),
    );
  }
}
