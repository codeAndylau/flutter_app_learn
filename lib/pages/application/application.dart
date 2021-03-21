import 'package:flutter/material.dart';
import 'package:flutter_app_learn/common/utils/utils.dart';
import 'package:flutter_app_learn/common/values/colors.dart';
import 'package:flutter_app_learn/common/widgets/app.dart';
import 'package:flutter_app_learn/common/widgets/widgets.dart';
import 'package:flutter_app_learn/pages/account/account.dart';
import 'package:flutter_app_learn/pages/bookmarks/bookmarks.dart';
import 'package:flutter_app_learn/pages/category/category.dart';
import 'package:flutter_app_learn/pages/main/main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app_learn/common/utils/iconfont.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  /// 当前选中的index
  int _selectedIndex = 0;

  /// 当前选中的页面
  PageController _pageController;

  // tab 页标题
  final List<String> _tabTitles = [
    'Welcome',
    'Cagegory',
    'Bookmarks',
    'Account'
  ];

  /// tabs
  final List<BottomNavigationBarItem> _bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        activeIcon: Icon(Icons.home),
        label: "home",
        tooltip: '兄弟,这是首页!'),
    BottomNavigationBarItem(
        icon: Icon(Iconfont.grid),
        activeIcon: Icon(Iconfont.grid),
        label: "grid",
        backgroundColor: AppColors.primaryBackground),
    BottomNavigationBarItem(
        icon: Icon(Iconfont.tag),
        activeIcon: Icon(Iconfont.grid),
        label: "tag",
        backgroundColor: AppColors.primaryBackground),
    BottomNavigationBarItem(
        icon: Icon(Iconfont.me),
        activeIcon: Icon(Iconfont.me),
        label: "me",
        backgroundColor: AppColors.primaryBackground)
  ];

  // tab栏动画
  // void _handleNavBarTap(int index) {
  //   _pageController.animateToPage(index,
  //       duration: const Duration(milliseconds: 200), curve: Curves.ease);
  // }

  // tab栏页码切换
  void _handlePageChanged(int index) {
    setState(() {
      this._selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      drawer: Container(
        color: Colors.blue,
        width: 300,
        child: Center(
          child: Text('drawer'),
        ),
      ),
      endDrawer: Container(
        color: Colors.orange,
        width: 300,
        child: Center(
          child: Text('endDrawer'),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Text('++'),
      ),
    );
  }

  /// 顶部导航栏
  Widget _buildAppBar() {
    return transparentAppBar(
        context: context,
        title: Text(_tabTitles[_selectedIndex],
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: 'Montserrat',
                fontSize: 18.ssp,
                fontWeight: FontWeight.w600)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: '不要这么暴力，不就是想点击了搜素按钮，你是想搜索小姐姐吗');
            },
          )
        ]);
  }

  /// 中间内容试图
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: [MainPage(), CategoryPage(), BookmarksPage(), AccountPage()],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  /// 底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomTabs,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 200), curve: Curves.ease);
        });
      },
    );
  }
}
