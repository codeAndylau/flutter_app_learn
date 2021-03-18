import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/common/utils/screen.dart';
import 'package:flutter_app_learn/common/values/values.dart';
import 'package:flutter_app_learn/common/widgets/input.dart';
import 'package:flutter_app_learn/common/widgets/toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> titleList = ["男装", "女装", "鞋包配饰", "礼品鲜花", "新鲜水果", "五金器材"];
  String selectTitle; // 选中的分类Code

  List<String> channelList = ["男装", "女装", "鞋包配饰", "礼品鲜花", "新鲜水果", "五金器材"];

  @override
  void initState() {
    super.initState();
    selectTitle = titleList[0];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCategories(),
          Divider(height: 1),
          _buildRecommend(),
          Divider(height: 1),
          _buildChannels(),
          Divider(height: 1),
          _buildNewsList(),
          Divider(height: 1),
          _buildEmailSubscribe(),
        ],
      ),
    );
  }

  // 分类菜单
  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: titleList.map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            height: 52.h,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectTitle = e;
                });
              },
              child: Text(
                e,
                style: TextStyle(
                    color: selectTitle == e
                        ? AppColors.secondaryElementText
                        : AppColors.primaryText,
                    fontSize: 18.ssp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // 推荐阅读
  Widget _buildRecommend() {
    return Container(
      margin: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 风景图
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Image.asset(
              'assets/images/feature-1.png',
              width: lcScreenHeight,
              fit: BoxFit.contain,
            ),
          ),
          // 作者
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Text(
              "作者标注位",
              style: TextStyle(
                  color: Colors.orange,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.bold,
                  fontSize: 15.ssp),
            ),
          ),
          // 标题
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Text(
              "标题占位符",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
                fontSize: 24.ssp,
                height: 1,
              ),
            ),
          ),
          // 一行三列
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 120),
                  child: Text(
                    "分类占位符",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "Avenir",
                        fontSize: 15.ssp,
                        height: 1),
                  ),
                ),
                SizedBox(width: 10),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 120,
                  ),
                  child: Text(
                    "时间占位符",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "Avenir",
                        fontSize: 15.ssp,
                        height: 1),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    print("点击了时间占位符下面的水波纹");
                  },
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.orange,
                    size: 24,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 频道
  Widget _buildChannels() {
    return Container(
      height: 100.h,
      width: lcScreenWidth,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: channelList.map<Widget>((e) {
            return Container(
              // color: Colors.orange,
              width: 80.w,
              height: 80.h,
              margin: EdgeInsets.only(left: 10),
              child: InkWell(
                onTap: () {
                  print("点击了频道分类是---$e");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 64.w,
                      width: 68.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 4,
                            top: 2,
                            right: 4,
                            child: Container(
                              width: 60.w,
                              height: 60.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [Shadows.primaryShadow],
                              ),
                              child: Container(),
                            ),
                          ),
                          ClipRRect(
                            child: Image.asset(
                              "assets/images/feature-1.png",
                              width: 60.w,
                              height: 60.w,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(30.w),
                          )
                        ],
                      ),
                    ),
                    Text(
                      e,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.w400,
                          fontSize: 15.ssp,
                          height: 1),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return Column(
        children: channelList.map<Widget>((e) {
      return Column(
        children: [
          Container(
            height: 140.h,
            padding: EdgeInsets.all(20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 图
                Image.asset(
                  "assets/images/feature-1.png",
                  width: 120.w,
                  height: 120.h,
                  fit: BoxFit.contain,
                ),
                // 右侧
                SizedBox(
                  width: 200.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // 作者
                      Container(
                        margin: EdgeInsets.all(0),
                        child: Text(
                          "作者名字占位符",
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                            fontSize: 15.ssp,
                            height: 1.5,
                          ),
                        ),
                      ),
                      // 标题
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        child: Text(
                          "标题占位符",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryText,
                            fontSize: 16.ssp,
                            height: 1,
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                        ),
                      ),
                      // Spacer
                      Spacer(),
                      // 一行 3 列
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // 分类
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 60.w,
                              ),
                              child: Text(
                                "分类占位符",
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.secondaryElementText,
                                  fontSize: 15.ssp,
                                  height: 1,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            // 添加时间
                            Container(color: Colors.pink, width: 15.w),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 100.w,
                              ),
                              child: Text(
                                '•时间占位符',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.pink,
                                  fontSize: 15.ssp,
                                  height: 1,
                                ),
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                              ),
                            ),
                            // 更多
                            Spacer(),
                            InkWell(
                              child: Icon(
                                Icons.more_horiz,
                                color: AppColors.primaryText,
                                size: 24,
                              ),
                              onTap: () {},
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
          Divider(height: 1)
        ],
      );
    }).toList());
  }

  // ad 广告条 邮件订阅
  Widget _buildEmailSubscribe() {
    return Container(
      margin: EdgeInsets.all(20.h),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Newsletter',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.ssp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.thirdElement,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.blue,
                  size: 17.ssp,
                ),
                onPressed: () {},
              ),
            ],
          ),

          // email
          inputEmailEdit(
            marginTop: 20,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            isPassword: false,
            controller: null,
          ),

          // btn subcrible
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Subscribe'),
            ),
          ),

          // disc
          Container(
            margin: EdgeInsets.only(top: 29.h),
            width: 260.w,
            child: Text.rich(TextSpan(children: <TextSpan>[
              TextSpan(
                text: 'By clicking on Subscribe button you agree to accept',
                style: new TextStyle(
                  color: AppColors.thirdElement,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.ssp,
                ),
              ),
              TextSpan(
                text: ' Privacy Policy',
                style: new TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.ssp,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    toastInfo(msg: 'Privacy Policy');
                  },
              ),
            ])),
          ),
        ],
      ),
    );
  }
}
