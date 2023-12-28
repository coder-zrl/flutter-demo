import 'package:flutter/material.dart';
import 'models/message/list.dart';

void main() {
  runApp(const MyApp());
}

// 有状态控件（有自己的数据）
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 每个项目最外层，必须有MaterialApp
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 指定首页
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4, // 底部4个按钮
        child: Scaffold(
          appBar: AppBar(
            //导航栏
            title: Text("App Name"),
            centerTitle: true,
            actions: <Widget>[
              //导航栏右侧菜单
              IconButton(icon: Icon(Icons.share), onPressed: () {}),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: const [
                UserAccountsDrawerHeader(
                  accountName: Text("小黑龙"),
                  accountEmail: Text("coder-zrl@qq.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://profile-avatar.csdnimg.cn/62f5b34a8df542a280ea32533b14fa69_m0_46521785.jpg')
                        // AssetImage('assets/images/userSide/avatar.png'),
                  ),
                  // 美化当前控件
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/userSide/background.png'),
                  )),
                ),
                ListTile(title: Text("用户反馈"), trailing: Icon(Icons.feedback)),
                ListTile(title: Text("系统设置"), trailing: Icon(Icons.settings)),
                ListTile(title: Text("我要发布"), trailing: Icon(Icons.send)),
                // 分割线
                Divider(),
                ListTile(title: Text("注销"), trailing: Icon(Icons.exit_to_app)),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(color: Colors.grey),
            // 一般都是50
            height: 80,
            child:
                TabBar(labelStyle: TextStyle(height: 0, fontSize: 10), tabs: [
              Tab(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Icon(Icons.message),
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: Text(
                              '10',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('消息'),
                  ],
                ),
              ),
              Tab(text: '通讯录', icon: Icon(Icons.contacts)),
              Tab(text: '发现', icon: Icon(Icons.explore)),
              Tab(text: '我的', icon: Icon(Icons.settings)),
            ]),
          ),
          body: TabBarView(
            children: [
              MessageListView(mt: '111'),
              MessageListView(mt: '222',),
              MessageListView(mt: '333',),
              MessageListView(mt: '444',),
            ],
          ),
        ));
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
