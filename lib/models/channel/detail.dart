import 'package:flutter/material.dart';

class ChannelDetail extends StatefulWidget {
  ChannelDetail({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  _ChannelDetailState createState() {
    return _ChannelDetailState();
  }
}

class _ChannelDetailState extends State<ChannelDetail> {
  @override
  Widget build(BuildContext context) {
    // return Container();
    // return Text(widget.type);
    return Scaffold(
      appBar: AppBar(
        title: Text('666'),
        centerTitle: true,
      ),
      body: Text('7777'),
    );
  }
}
