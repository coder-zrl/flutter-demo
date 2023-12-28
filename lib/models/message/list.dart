import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mc/models/channel/detail.dart';

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
// AutomaticKeepAliveClientMixin是一个抽象类，它提供了一个wantKeepAlive属性，再回到页面不会被销毁
class _MessageListState extends State<MessageListView>
    with AutomaticKeepAliveClientMixin {
  int uid = 0;
  var messageList = [];

  // 保持页面不被销毁
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getMessageList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messageList.length,
        itemBuilder: (BuildContext context, int index) {
          var message = messageList[index];
          // 横向组件
          return GestureDetector(
            onTap: () {
              // 实现导航
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ChannelDetail(type: message['type']);
              }));
              print(message['question']);
            },
            child: Container(
                height: 200,
                // BorderSide是分割线
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(color: Colors.black12))),
                child: Row(
                  children: [
                    Image.network(
                      'https://img0.baidu.com/it/u=1188758416,1463896044&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=936',
                      width: 130,
                      height: 180,
                      fit: BoxFit.cover, //撑满整个元素
                    ),
                    // 纵向排列
                    Container(
                      // 左侧间距10
                      padding: EdgeInsets.only(left: 10),
                      height: 200,
                      child: Column(
                        // 左端对齐
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // 纵向平分剩余的区域
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(message['type']),
                          Text(message['difficulty']),
                          Text(message['correct_answer']),
                          Text(message['category']),
                        ],
                      ),
                    )
                  ],
                )),
          );
          return Text(index.toString());
        });
  }

  getMessageList() async {
    // print('xxx${widget.mt}');
    var resp = await dio.get(
        'https://opentdb.com/api.php?amount=10&category=23&difficulty=easy&type=multiple');
    // print(resp);
    var result = resp.data;
    // 为私有数据赋值，否则页面不会更新
    setState(() {
      // print(result);
      // dio返回的数据，用[]访问
      messageList = result['results'];
    });
  }
}
