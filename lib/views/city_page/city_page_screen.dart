import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/city_cubit/city_cubit.dart';
import 'package:rafiq/logic/cubit/city_cubit/tab_city_cubit.dart';
import 'package:rafiq/views/city_page/widgets/city_cover.dart';
import 'package:rafiq/views/city_page/widgets/city_information.dart';
import 'package:rafiq/views/city_page/widgets/love_city_button.dart';
import 'package:rafiq/views/city_page/widgets/sliver_app_bar_city/sliver_app_bar_city.dart';
import 'package:rafiq/views/profile/widgets/sliver_app_bar/sliver_app_bar.dart';
import 'package:rafiq/views/profile/widgets/tap_bar_view.dart';

class CityPageScreen extends StatelessWidget {
  const CityPageScreen({Key? key}) : super(key: key);
  static const routeName = '/city_screen';

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    // context.read<GetUserPostsCubit>().getFirstPosts(userID: userName);

    return BlocProvider(
      create: (context) => TabCityCubit(),
      child:
          BlocConsumer<CityCubit, CityState>(listener: (context, state) async {
        //   await context.read<UserDataCubit>().getUserData();
      }, builder: (context, state) {
        return DefaultTabController(
          length: 4,
          initialIndex: 0,
          child: SafeArea(
            child: Builder(builder: (context) {
              TabController _tabController = DefaultTabController.of(context)!;

              _tabController.addListener(
                () => BlocProvider.of<TabCityCubit>(context)
                    .changeIndex(_tabController.index),
              );
              return Scaffold(
                body: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Column(
                              children: [
                                SizedBox(
                                  height: h(225),
                                  child: Stack(
                                    children: const [
                                      CityCover(),
                                      LoveCityButton(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: h(18),
                                ),
                                const CityInformation(),
                                SizedBox(
                                  height: h(25),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SliverAppBarCity(
                          innerBoxIsScrolled: innerBoxIsScrolled,
                          tabController: _tabController)
                    ];
                  },
                  body: TabBarViewWidget(
                    tabController: _tabController,
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
