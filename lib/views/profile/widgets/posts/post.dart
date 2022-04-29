import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/logic/cubit/post/post_screen_cubit/post_cubit.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    var cubit = context.read<UserDataCubit>();
    return BlocProvider(
      create: (context) => PostCubit(),
      child: Container(
        color: const Color(0xffDBD4DD),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: h(10), bottom: h(14)),
              child: Row(
                children: [
                  SizedBox(width: w(9)),
                  Container(
                    width: w(42),
                    height: h(42),
                    decoration: BoxDecoration(
                      color: const Color(0xff5B618A),
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: const Color(0xffE8DEEB), width: 2),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(cubit.avatar!),
                      ),
                    ),
                  ),
                  SizedBox(width: w(6)),
                  Container(
                    width: w(121),
                    child: FittedBox(
                      child: AutoSizeText(
                        '${cubit.firstName} ${cubit.lastName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF5B618A),
                          fontFamily: 'DavidLibre',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: w(160)),
                  SvgPicture.asset('assets/images/Options.svg')
                ],
              ),
            ),
            SizedBox(
              height: h(290),
              child: Stack(
                children: [
                  SizedBox(
                    width: w(390),
                    height: h(224),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: w(380),
                          // height: h(224),
                          child: const Image(
                            image: AssetImage('assets/images/test1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: w(380),
                          child: const Image(
                            image: AssetImage('assets/images/test1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: w(380),
                          child: const Image(
                            image: AssetImage('assets/images/test2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<PostCubit, PostState>(
                    builder: (context, state) {
                      return Positioned(
                        bottom: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            context.read<PostCubit>().isMore
                                ? Container(
                                    color: const Color(0xffDBD4DD),
                                    width: w(390),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: w(10), right: w(15)),
                                      child: const AutoSizeText(
                                        'Albania possesses significant diversity with the landscape ranging from the snow-capped mountains in the Albanian Alps as well as the Korab, Skanderbeg, Pindus and Ceraunian Mountains to the hot and sunny coasts of the Albanian Adriatic and Ionian Sea along the Mediterranean Sea.',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0XFF5B618A),
                                          fontFamily: 'DavidLibre',
                                        ),
                                        maxLines: 2,
                                        minFontSize: 18,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                : Container(
                                    color: const Color(0xffDBD4DD),
                                    width: w(390),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: w(10), right: w(15), top: h(5)),
                                      child: const AutoSizeText(
                                        'Albania possesses significant diversity with the landscape ranging from the snow-capped mountains in the Albanian Alps as well as the Korab, Skanderbeg, Pindus and Ceraunian Mountains to the hot and sunny coasts of the Albanian Adriatic and Ionian Sea along the Mediterranean Sea.',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0XFF5B618A),
                                          fontFamily: 'DavidLibre',
                                        ),
                                        minFontSize: 18,
                                      ),
                                    )),

                            // see more widget
                            InkWell(
                              onTap: () {
                                context.read<PostCubit>().changeSeeMore();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: w(25)),
                                child: AutoSizeText(
                                  context.read<PostCubit>().label,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0XFF5B618A)
                                        .withOpacity(0.60),
                                    fontFamily: 'DavidLibre',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: h(5)),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // SizedBox(height: h(5)),
            //  SizedBox(height: h(9)),

            Row(
              children: [
                SizedBox(width: w(9)),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite_border,
                        color: Color(0XFF5B618A),
                        size: 30,
                      ),
                    ),
                    //   Icons.favorite,
                    const AutoSizeText(
                      '10',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0XFF5B618A),
                        fontFamily: 'DavidLibre',
                      ),
                    ),
                  ],
                ),
                SizedBox(width: w(24)),
                Column(
                  children: [
                    InkWell(
                      child: SvgPicture.asset(
                        'assets/images/comments.svg',
                        width: w(27),
                        height: h(27),
                      ),
                    ),
                    const AutoSizeText(
                      '2',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0XFF5B618A),
                        fontFamily: 'DavidLibre',
                      ),
                    ),
                  ],
                ),
                SizedBox(width: w(244)),
                InkWell(
                  child: SvgPicture.asset(
                    'assets/images/share.svg',
                    width: w(27),
                    height: h(27),
                  ),
                ),
              ],
            ),
            SizedBox(height: h(7)),
          ],
        ),
      ),
    );
  }
}
