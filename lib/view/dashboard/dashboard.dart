import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andomie/utils.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:get/get.dart';

import '../../data/model/trade_model.dart';
import '../../res/components/appbar_title.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exception.dart';
import '../../res/routes/routes_name.dart';
import '../../viewmodel/controllers/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController controller = DashboardController();

  @override
  void initState() {
    controller.fetchUserTrades();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.darkness(05),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppbarTitle(
          text: "Trades",
        ),
        actions: [
          IconView(
            icon: Icons.person,
            marginHorizontal: 16,
            onClick: (con) => Get.toNamed(RouteName.profile),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Center(
          child: Obx(() {
            final response = controller.tradeResponse.value;
            if (response.isLoading) {
              return const CircularProgressIndicator();
            } else if (response.result.isEmpty) {
              return GeneralExceptionView(
                onClick: (con) => _refresh(),
              );
            } else if (response.isInternetError) {
              return InternetExceptionView(
                onClick: (con) => _refresh(),
              );
            } else {
              return Stack(
                alignment: Alignment.center,
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 100,
                      left: 16,
                      right: 16,
                    ),
                    itemBuilder: (con, index) {
                      final item = response.result[index];
                      return LinearLayout(
                        padding: 16,
                        background: Colors.white,
                        borderRadius: 24,
                        children: item.source.entries.map((e) {
                          return LinearLayout(
                            orientation: Axis.horizontal,
                            paddingVertical: 4,
                            children: [
                              TextView(
                                flex: 1,
                                text: e.key.toString().uppercase,
                                textColor: Colors.black,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                              const TextView(text: " : "),
                              TextView(
                                flex: 2,
                                text: e.value.toString(),
                                textColor: Colors.grey,
                                textOverflow: TextOverflow.ellipsis,
                                marginStart: 8,
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    },
                    separatorBuilder: (con, index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemCount: response.result.size,
                  ),
                  TextView(
                    text:
                        "Total Profit : ${_totalProfit(response.result).toStringAsFixed(2)}",
                    textSize: 18,
                    textColor: Colors.white,
                    textFontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    gravity: Alignment.center,
                    positionType: ViewPositionType.bottomFlex,
                    background: context.primaryColor,
                    borderRadiusTL: 16,
                    borderRadiusTR: 16,
                    paddingHorizontal: 16,
                    paddingVertical: 16,
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }

  double _totalProfit(List<TradeModel> trades) {
    var profit = 0.0;
    for (var v in trades) {
      profit += v.profit.use;
    }
    return profit;
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 500));
    controller.fetchUserTrades();
  }
}
