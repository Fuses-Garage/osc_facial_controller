import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:osc_facial_controller/type/pallet.dart';

class PalletsSelectScreen extends StatefulWidget {
  const PalletsSelectScreen({super.key});
  @override
  State<PalletsSelectScreen> createState() => _PalletsSelectScreenState();
}

class _PalletsSelectScreenState extends State<PalletsSelectScreen> {
  List<dynamic> keys = [];
  Box<Pallet>? box;
  @override
  void initState() {
    super.initState();
    Hive.openBox<Pallet>("pallets").then((box) => {
          setState(() {
            keys = box.keys.toList();
            this.box = box;
          })
        });
  }

  Widget _getDropdownButton(String key, Box<Pallet>? box) {
    void onChanged(String? v) {
      var k = v ?? "";
      switch (k) {
        case "編集":
          Navigator.pushNamed(context, "/edit", arguments: key);
          break;
        case "削除":
          box?.delete(key).then((v) => {
                setState(() {
                  keys = this.box?.keys.toList() ?? [];
                })
              });

          break;
      }
    }

    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {
        showMenu<String>(
          context: context,
          position: const RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
          items: <PopupMenuItem<String>>[
            const PopupMenuItem<String>(
                value: '編集',
                child: Row(
                  children: const [
                    Icon(Icons.edit),
                    Text('編集'),
                  ],
                )),
            const PopupMenuItem<String>(
                value: '削除',
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    Text('削除'),
                  ],
                )),
          ],
        ).then((value) {
          onChanged(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("表情コントローラー"),
      ),
      body: ListView.builder(
        itemCount: keys.length + 1, //1足す
        itemBuilder: (context, index) {
          if (index == keys.length) {
            //末尾は新規追加タイル
            return ListTile(
              title: const Text("パレットの新規作成"),
              trailing: const Icon(Icons.add),
              onTap: () =>
                  Navigator.pushNamed(context, "/edit", arguments: null),
            );
          }
          return ListTile(
            title: Text('${keys[index]}'),
            trailing: _getDropdownButton(keys[index], box),
            onTap: () => {
              Navigator.pushNamed(context, "/controller",
                  arguments: keys[index]),
            },
          );
        },
      ),
    );
  }
}
