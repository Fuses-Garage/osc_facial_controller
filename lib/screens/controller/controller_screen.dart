import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:osc_facial_controller/screens/controller/component/gesture_button.dart';
import 'package:osc_facial_controller/type/pallet.dart';
import 'package:osc/osc.dart';
import 'dart:io';

class ControllerScreen extends StatefulWidget {
  final String? palletkey;
  const ControllerScreen({super.key, this.palletkey});
  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  final int port = 9000;
  String _ip = "127.0.0.1";
  Pallet? pallet;
  @override
  void initState() {
    Hive.openBox<Pallet>("pallets").then((box) => {
          setState(() {
            pallet = box.get(widget.palletkey);
          })
        });
    super.initState();
  }

  void send(String dir, int index) {
    //OSCメッセージをPCに送る
    final destination = InternetAddress.tryParse(_ip); //IPアドレス
    if (destination != null) {
      //正常にパースできたなら
      final address = "/avatar/parameters/G$dir"; //パス
      final message = OSCMessage(address, arguments: [index]);

      RawDatagramSocket.bind(InternetAddress.anyIPv4, 0).then((socket) {
        final bytes = message.toBytes();
        socket.send(bytes, destination, port);
        socket.close();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("表情コントローラー"),
      ),
      body: Center(
          child: Column(children: [
        TextField(
          onChanged: (str) => setState(() {
            _ip = str;
          }),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'PCのIPアドレスを入力してください',
          ),
        ),
        GridView.count(
          shrinkWrap: true, //trueにしないとエラーが出る
          crossAxisCount: 4, //4個で1行
          children: <Widget>[
            GestureButton(
                index: 1,
                namelabel: pallet?.leftfist,
                defaultname: "Left Fist",
                direction: "L",
                send: send),
            GestureButton(
                index: 0,
                namelabel: pallet?.leftidle,
                defaultname: "Left Idle",
                direction: "L",
                send: send),
            GestureButton(
                index: 0,
                namelabel: pallet?.rightidle,
                defaultname: "Right Idle",
                direction: "R",
                send: send),
            GestureButton(
                index: 1,
                namelabel: pallet?.rightfist,
                defaultname: "Right Fist",
                direction: "R",
                send: send),
            GestureButton(
                index: 3,
                namelabel: pallet?.leftpoint,
                defaultname: "Left Point",
                direction: "L",
                send: send),
            GestureButton(
                index: 2,
                namelabel: pallet?.leftopen,
                defaultname: "Left Open",
                direction: "L",
                send: send),
            GestureButton(
                index: 2,
                namelabel: pallet?.rightopen,
                defaultname: "Right Open",
                direction: "R",
                send: send),
            GestureButton(
                index: 3,
                namelabel: pallet?.rightpoint,
                defaultname: "Right Point",
                direction: "R",
                send: send),
            GestureButton(
                index: 5,
                namelabel: pallet?.leftrocknroll,
                defaultname: "Left Rock 'N' Roll",
                direction: "L",
                send: send),
            GestureButton(
                index: 4,
                namelabel: pallet?.leftvictory,
                defaultname: "Left Victory",
                direction: "L",
                send: send),
            GestureButton(
                index: 4,
                namelabel: pallet?.rightvictory,
                defaultname: "Right Victory",
                direction: "R",
                send: send),
            GestureButton(
                index: 5,
                namelabel: pallet?.rightrocknroll,
                defaultname: "Right Rock 'N' Roll",
                direction: "R",
                send: send),
            GestureButton(
                index: 7,
                namelabel: pallet?.leftthumbsup,
                defaultname: "Left ThumbsUp",
                direction: "L",
                send: send),
            GestureButton(
                index: 6,
                namelabel: pallet?.leftgun,
                defaultname: "Left Gun",
                direction: "L",
                send: send),
            GestureButton(
                index: 6,
                namelabel: pallet?.rightgun,
                defaultname: "Right Gun",
                direction: "R",
                send: send),
            GestureButton(
                index: 7,
                namelabel: pallet?.rightthumbsup,
                defaultname: "Right ThumbsUp",
                direction: "R",
                send: send),
          ],
        ),
      ])),
    );
  }
}
