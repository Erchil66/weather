import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:weathercheck/assets/imagestring.dart';
import 'package:weathercheck/constant/colors.dart';
import 'package:weathercheck/controllers/myhomecontroller.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:weathercheck/widgets/weatheritem/item.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyhomeController());
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [pink, tint],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 0, left: 0, top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(svgfilter),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        controller.placelist.isEmpty
                            ? const SizedBox.shrink()
                            : SizedBox(
                                height: 377.dp,
                                child: Obx(
                                  () => PageView.builder(
                                      clipBehavior: Clip.none,
                                      controller: controller.pagecontroller,
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: controller.placelist.length,
                                      onPageChanged: (s) =>
                                          controller.onchange(s),
                                      itemBuilder: (context, index) {
                                        return Obx(
                                          () => Transform.scale(
                                            scale:
                                                controller.currentindex.value ==
                                                        index
                                                    ? 1.1
                                                    : 0.9,
                                            child: WeatherItem(
                                              todayicon: cloud2,
                                              place:
                                                  " ${controller.searchlist[index].name}",
                                              date: controller.format
                                                  .format(DateTime.now()),
                                              status1: controller
                                                  .placelist[index]
                                                  .current!
                                                  .condition!
                                                  .text,
                                              status2: "",
                                              humidity: controller
                                                  .placelist[index]
                                                  .current!
                                                  .humidity!
                                                  .toString(),
                                              press: () {},
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
