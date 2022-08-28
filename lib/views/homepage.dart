import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:weathercheck/assets/imagestring.dart';
import 'package:weathercheck/constant/colors.dart';
import 'package:weathercheck/constant/returnimage.dart';
import 'package:weathercheck/controllers/myhomecontroller.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:weathercheck/font/fontfamily.dart';
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
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SvgPicture.asset(svgfilter),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        controller.placelist.isEmpty
                            ? const SizedBox.shrink()
                            : SizedBox(
                                height: 377.dp,
                                child: PageView.builder(
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
                                              todayicon:
                                                  ReturnImage.manualreturn(
                                                      controller
                                                          .placelist[index]
                                                          .current!
                                                          .condition!
                                                          .text!),
                                              place:
                                                  " ${controller.searchlist[index].name}",
                                              date: controller.format
                                                  .format(DateTime.now()),
                                              status1: controller
                                                  .placelist[index]
                                                  .current!
                                                  .condition!
                                                  .text,
                                              status2: controller
                                                  .placelist[index]
                                                  .current!
                                                  .windDir,
                                              humidity: controller
                                                  .placelist[index]
                                                  .current!
                                                  .tempC!
                                                  .toStringAsFixed(0),
                                              press: () =>
                                                  controller.onselectedgoto(
                                                      controller
                                                          .placelist[index],
                                                      controller
                                                          .searchlist[index]
                                                          .name),
                                            )),
                                      );
                                    }),
                              ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          width: 190.dp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                waterdrop,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Precipitation",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18.dp,
                                    fontFamily: fontMedium,
                                    color: white),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                controller.precipitation.value.isEmpty
                                    ? ""
                                    : "${controller.precipitation.value} %",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18.dp,
                                    fontFamily: fontMedium,
                                    color: white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 160.dp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                humidity,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Humidity",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18.dp,
                                    fontFamily: fontMedium,
                                    color: white),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                controller.humidity.value.isEmpty
                                    ? ""
                                    : "${controller.humidity.value} %",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18.dp,
                                    fontFamily: fontMedium,
                                    color: white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 160.dp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                wind,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Wind",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18.dp,
                                    fontFamily: fontMedium,
                                    color: white),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                controller.wind.value.isEmpty
                                    ? ""
                                    : "${controller.wind.value} km/h",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18.dp,
                                    fontFamily: fontMedium,
                                    color: white),
                              ),
                            ],
                          ),
                        )
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
