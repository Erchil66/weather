import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weathercheck/assets/imagestring.dart';
import 'package:weathercheck/constant/colors.dart';
import 'package:weathercheck/constant/returnimage.dart';
import 'package:weathercheck/controllers/myhomecontroller.dart';
import 'package:weathercheck/font/fontfamily.dart';

class Weatherdetail extends StatelessWidget {
  const Weatherdetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyhomeController());
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(
        () => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -50,
                          right: -100,
                          child: Image.asset(
                            ReturnImage.manualreturn(controller.currentselected
                                .value.current!.condition!.text),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => Get.back(),
                                  child: SvgPicture.asset(back),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "${controller.placename.value} \n ${controller.currentselected.value.location!.country}",
                                  style: TextStyle(
                                    fontSize: 30.dp,
                                    fontFamily: fontBold,
                                    color: textColor,
                                  ),
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    controller.currentselected
                                                        .value.current!.tempC!
                                                        .toStringAsFixed(0),
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: 96.dp,
                                                        fontFamily: fontBold,
                                                        color: textColor),
                                                  ),
                                                  SizedBox(
                                                    height: 45.dp,
                                                    child: Text(
                                                      "°C",
                                                      style: TextStyle(
                                                          fontSize: 24.dp,
                                                          fontFamily:
                                                              fontMedium,
                                                          color: textColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 275.dp,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Chip(
                                  backgroundColor: skyblue.withOpacity(0.1),
                                  label: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        waterdrop,
                                        color: skyblue,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "${controller.currentselected.value.current!.cloud.toString()} %",
                                        style: TextStyle(
                                          fontSize: 14.dp,
                                          fontFamily: fontBold,
                                          color: skyblue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Chip(
                                  backgroundColor: red.withOpacity(0.1),
                                  label: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        humidity,
                                        color: red,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "${controller.currentselected.value.current!.tempC!.toStringAsFixed(0)} %",
                                        style: TextStyle(
                                          fontSize: 14.dp,
                                          fontFamily: fontBold,
                                          color: red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Chip(
                                  backgroundColor: purple.withOpacity(0.1),
                                  label: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        wind,
                                        color: purple,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "${controller.currentselected.value.current!.windKph} km/h",
                                        style: TextStyle(
                                          fontSize: 14.dp,
                                          fontFamily: fontBold,
                                          color: purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      width: 375.dp,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.forecastList.length,
                          itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          controller.format1getday.format(
                                              controller
                                                  .forecastList[index].date!),
                                          style: TextStyle(
                                            fontSize: 18.dp,
                                            fontFamily: fontBold,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        ReturnImage.manualreturn(controller
                                            .forecastList[index]
                                            .day!
                                            .condition!
                                            .text),
                                        height: 50.dp,
                                      ),
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              controller.forecastList[index]
                                                  .day!.maxtempC!
                                                  .toStringAsFixed(0),
                                              style: TextStyle(
                                                fontSize: 18.dp,
                                                fontFamily: fontBold,
                                                color: textColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 18.dp,
                                              child: Text(
                                                "°C",
                                                style: TextStyle(
                                                    fontSize: 8.dp,
                                                    fontFamily: fontMedium,
                                                    color: textColor),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Text(
                                              controller.forecastList[index]
                                                  .day!.avgtempC!
                                                  .toStringAsFixed(0),
                                              style: TextStyle(
                                                fontSize: 18.dp,
                                                fontFamily: fontBold,
                                                color: textColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 18.dp,
                                              child: Text(
                                                "°C",
                                                style: TextStyle(
                                                    fontSize: 8.dp,
                                                    fontFamily: fontMedium,
                                                    color: textColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
