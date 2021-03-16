import 'package:flutter/material.dart';
import 'package:flutter_app_learn/common/utils/screen.dart';
import 'package:flutter_app_learn/common/values/colors.dart';
import 'package:flutter_app_learn/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void getHttp() async {
    try {
      Response response = await Dio().post(
          "https://test.bazirim.life/mobile_app/index.php?bz_ctr=goods&bz_func=goods_list");
      print('请求的数据---${response.data.toString()}');
    } catch (e) {
      print(e);
    }
  }

  /// 页头标题
  Widget _buildPageHeadTitle() {
    return Container(
      margin: EdgeInsets.only(top: lcSetHeight(65)),
      child: Text(
        'Features',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: lcSetFontSize(24)),
      ),
    );
  }

  /// 页头说明
  Widget _buildPageHeadDetail() {
    return Container(
      margin: EdgeInsets.only(top: lcSetHeight(15)),
      width: lcSetWidth(245),
      height: lcSetHeight(70),
      child: Text(
        "The best of news channels all in one place. Trusted sources and personalized news for you.",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.normal,
            fontSize: lcSetFontSize(16),
            height: 1.2),
      ),
    );
  }

  /// 特性说明
  Widget _buildFeatureItem(String imageName, String intro, double marginTop) {
    return Container(
      margin: EdgeInsets.only(top: lcSetHeight(marginTop)),
      width: lcSetWidth(295),
      height: lcSetHeight(80),
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            child:
                Image.asset('assets/images/$imageName.png', fit: BoxFit.none),
          ),
          Spacer(),
          Container(
            width: 195.w,
            child: Text(
              intro,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.normal,
                  fontSize: 16.nsp),
            ),
          )
        ],
      ),
    );
  }

  /// 提交按钮
  Widget _buildStarButton() {
    return Container(
      width: 295.w,
      height: 44.h,
      margin: EdgeInsets.only(bottom: lcBottomBarHeight),
      child: ElevatedButton(
        child: Text('get started'),
        onPressed: () {
          //getHttp();
          Navigator.of(context).pushNamed('/sign_in');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375.0, 812.0 - 44.0 - 34.0),
        allowFontScaling: false,
        builder: () {
          return Scaffold(
            body: Center(
              child: Column(children: [
                _buildPageHeadTitle(),
                _buildPageHeadDetail(),
                _buildFeatureItem(
                  "feature-1",
                  "C2ompelling photography and typography provide a beautiful reading",
                  86,
                ),
                _buildFeatureItem(
                  "feature-2",
                  "Sector news never shares your personal data with advertisers or publishers",
                  40,
                ),
                _buildFeatureItem(
                  "feature-3",
                  "You can get Premium to unlock hundreds of publications",
                  40,
                ),
                Spacer(),
                _buildStarButton()
              ]),
            ),
          );
        });
  }
}
