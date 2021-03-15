import 'package:flutter/material.dart';
import 'package:flutter_app_learn/common/utils/screen.dart';
import 'package:flutter_app_learn/common/utils/validator.dart';
import 'package:flutter_app_learn/common/values/colors.dart';
import 'package:flutter_app_learn/common/values/shadows.dart';
import 'package:flutter_app_learn/common/widgets/button.dart';
import 'package:flutter_app_learn/common/widgets/toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app_learn/common/widgets/input.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// 执行登录操作
  _handleSignIn() {
    if (_emailController.value.text.isEmpty) {
      toastInfo(msg: '请输入邮件');
      return;
    }

    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请正确输入邮件');
      return;
    }

    if (!duCheckStringLength(_passwordController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
  }

  /// 注册
  _handleNavSignUp() {
    Navigator.of(context).pushNamed('/sign_up');
  }

  // logo
  Widget _buildLogo() {
    return Container(
      width: 110.w,
      margin: EdgeInsets.only(top: 88.w), // 顶部系统栏 44px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 76.w,
            width: 76.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 76.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.circular(38.w), // 父容器的50%
                    ),
                    child: Container(),
                  ),
                ),
                Positioned(
                  top: 15.w,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.w),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 24.ssp,
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: 16.ssp,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(top: 50.h),
      child: Column(
        children: [
          // email input
          inputTextEdit(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            marginTop: 0,
          ),
          // password input
          inputTextEdit(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            isPassword: true,
          ),

          // 注册、登录 横向布局
          Container(
            height: 44.h,
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              children: [
                // 注册
                btnFlatButtonWidget(
                  onPressed: _handleNavSignUp,
                  gbColor: AppColors.thirdElement,
                  title: "Sign up",
                ),
                Spacer(),
                // 登录
                btnFlatButtonWidget(
                  onPressed: _handleSignIn,
                  gbColor: AppColors.primaryElement,
                  title: "Sign in",
                ),
              ],
            ),
          ),

          // Fogot password
          Container(
              height: 40.h,
              margin: EdgeInsets.only(top: 20.h),
              child: TextButton(
                onPressed: () => null,
                child: Text(
                  "Fogot password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.ssp,
                    height: 1, // 设置下行高，否则字体下沉
                  ),
                ),
              )),
        ],
      ),
    );
  }

  // 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(bottom: 40.h),
      child: Column(
        children: <Widget>[
          // title
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: 16.ssp,
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "google",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "facebook",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignupButton() {
    return Container(
      width: 295.w,
      height: 44.h,
      margin: EdgeInsets.only(bottom: lcBottomBarHeight),
      child: ElevatedButton(
        child: Text('Sign Up'),
        onPressed: () {
          Navigator.of(context).pushNamed('/sign_up');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildSignupButton()
          ],
        ),
      ),
    );
  }
}
