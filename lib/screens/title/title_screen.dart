import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});
  void _changescreen(BuildContext context) {
    Navigator.of(context).pushNamed("/select"); //パレット選択画面に移動する
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("タイトル画面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("OSC表情コントローラー", style: TextStyle(fontSize: 32)),
            FilledButton(
                onPressed: () => _changescreen(context), //押下時画面遷移
                child:
                    const Text("Screen Change", style: TextStyle(fontSize: 32)))
          ],
        ),
      ),
    );
  }
}
