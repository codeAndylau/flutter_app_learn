import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _selCategoryCode; // 选中的分类Code

  // 分类菜单
  Widget _buildCategories() {
    return Container(child: Text('分类菜单'));
    // return _categories == null
    // ? Container()
    // : newsCategoriesWidget(
    //     categories: _categories,
    //     selCategoryCode: _selCategoryCode,
    //     onTap: (CategoryResponseEntity item) {
    //       _loadNewsData(item.code);
    //     },
    //   );
  }

  // 推荐阅读
  Widget _buildRecommend() {
    return Container(child: Text('推荐阅读'));
    // return _newsRecommend == null // 数据没到位，可以用骨架图展示
    //     ? Container()
    //     : recommendWidget(_newsRecommend);
  }

  // 频道
  Widget _buildChannels() {
    return Container(child: Text('频道'));
    // return _channels == null
    //     ? Container()
    //     : newsChannelsWidget(
    //         channels: _channels,
    //         onTap: (ChannelResponseEntity item) {},
    //       );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return Container(child: Text('新闻列表'));
    // return _newsPageList == null
    //     ? Container(
    //         height: duSetHeight(161 * 5 + 100.0),
    //       )
    //     : Column(
    //         children: _newsPageList.items.map((item) {
    //           return Column(
    //             children: <Widget>[
    //               newsItem(item),
    //               Divider(height: 1),
    //             ],
    //           );
    //         }).toList(),
    //       );
  }

  // ad 广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return Container(child: Text('邮件订阅'));
    // return newsletterWidget();
  }

  @override
  void initState() {
    super.initState();
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
}
