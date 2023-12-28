import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = Dio();

class MessageListView extends StatefulWidget {
  MessageListView({Key? key, required this.mt}) : super(key: key);
  final String mt;

  @override
  _MessageListState createState() {
    return new _MessageListState();
  }
}

// 有状态空间，必须结合一个状态管理类
class _MessageListState extends State<MessageListView> {
  int uid = 0;
  var messageList = [];

  @override
  void initState() {
    super.initState();
    getMessageList();
  }

  @override
  Widget build(BuildContext context) {
    return Text("这是消息列表" + widget.mt);
  }

  getMessageList() async {
    print('xxx${widget.mt}');
    var resp = await dio.get('https://e.weather.com.cn/pubm/videos_vms1.htm?callback=getLbDatas&_=1703752835708');
    var result = resp.data;
    // 为私有数据赋值，否则页面不会更新
    setState(() {
      // dio返回的数据，用[]访问
      messageList = resp['data'];
    });
    print(resp);
  }
}
