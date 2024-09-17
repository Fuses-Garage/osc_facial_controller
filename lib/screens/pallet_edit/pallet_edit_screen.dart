import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:osc_facial_controller/type/pallet.dart';

class PalletEditScreen extends StatefulWidget {
  const PalletEditScreen({super.key, this.palletkey});
  final String? palletkey;
  @override
  State<PalletEditScreen> createState() => _PalletEditScreenState();
}

class _PalletEditScreenState extends State<PalletEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fieldKeyName = GlobalKey<FormFieldState>();
  final _fieldKeyL0 = GlobalKey<FormFieldState>();
  final _fieldKeyL1 = GlobalKey<FormFieldState>();
  final _fieldKeyL2 = GlobalKey<FormFieldState>();
  final _fieldKeyL3 = GlobalKey<FormFieldState>();
  final _fieldKeyL4 = GlobalKey<FormFieldState>();
  final _fieldKeyL5 = GlobalKey<FormFieldState>();
  final _fieldKeyL6 = GlobalKey<FormFieldState>();
  final _fieldKeyL7 = GlobalKey<FormFieldState>();
  final _fieldKeyR0 = GlobalKey<FormFieldState>();
  final _fieldKeyR1 = GlobalKey<FormFieldState>();
  final _fieldKeyR2 = GlobalKey<FormFieldState>();
  final _fieldKeyR3 = GlobalKey<FormFieldState>();
  final _fieldKeyR4 = GlobalKey<FormFieldState>();
  final _fieldKeyR5 = GlobalKey<FormFieldState>();
  final _fieldKeyR6 = GlobalKey<FormFieldState>();
  final _fieldKeyR7 = GlobalKey<FormFieldState>();
  Box<Pallet>? box;
  Pallet initialpallet = Pallet(
      leftidle: "Left Idle",
      leftfist: "Lfet Fist",
      leftopen: "Left Open",
      leftpoint: "Left Point",
      leftvictory: "Left Victory",
      leftrocknroll: "Left Rock'n'Roll",
      leftgun: "Left Gun",
      leftthumbsup: "Left Thumbsup",
      rightidle: "Right Idle",
      rightfist: "Right Fist",
      rightopen: "Right Open",
      rightpoint: "Right Point",
      rightvictory: "Right Victory",
      rightrocknroll: "Right Rock'n'Roll",
      rightgun: "RIght Gun",
      rightthumbsup: "Right Thumbsup");

  @override
  void initState() {
    super.initState();
    Hive.openBox<Pallet>("pallets").then((box) => {
          setState(() {
            this.box = box;
            var pallet = box.get(widget.palletkey);
            if (pallet != null) {
              _fieldKeyName.currentState!.didChange(widget.palletkey);
              _fieldKeyL0.currentState!.didChange(pallet.leftidle);
              _fieldKeyL1.currentState!.didChange(pallet.leftfist);
              _fieldKeyL2.currentState!.didChange(pallet.leftopen);
              _fieldKeyL3.currentState!.didChange(pallet.leftpoint);
              _fieldKeyL4.currentState!.didChange(pallet.leftvictory);
              _fieldKeyL5.currentState!.didChange(pallet.leftrocknroll);
              _fieldKeyL6.currentState!.didChange(pallet.leftgun);
              _fieldKeyL7.currentState!.didChange(pallet.leftthumbsup);
              _fieldKeyR0.currentState!.didChange(pallet.rightidle);
              _fieldKeyR1.currentState!.didChange(pallet.rightfist);
              _fieldKeyR2.currentState!.didChange(pallet.rightopen);
              _fieldKeyR3.currentState!.didChange(pallet.rightpoint);
              _fieldKeyR4.currentState!.didChange(pallet.rightvictory);
              _fieldKeyR5.currentState!.didChange(pallet.rightrocknroll);
              _fieldKeyR6.currentState!.didChange(pallet.rightgun);
              _fieldKeyR7.currentState!.didChange(pallet.rightthumbsup);
            } else {
              pallet = initialpallet;
            }
          })
        });
  }

  void returnPage() {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pushNamed(context, "/select");
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      await box
          ?.put(
              _fieldKeyName.currentState?.value,
              Pallet(
                  leftidle: _fieldKeyL0.currentState?.value,
                  leftfist: _fieldKeyL1.currentState?.value,
                  leftopen: _fieldKeyL2.currentState?.value,
                  leftpoint: _fieldKeyL3.currentState?.value,
                  leftvictory: _fieldKeyL4.currentState?.value,
                  leftrocknroll: _fieldKeyL5.currentState?.value,
                  leftgun: _fieldKeyL6.currentState?.value,
                  leftthumbsup: _fieldKeyL7.currentState?.value,
                  rightidle: _fieldKeyR0.currentState?.value,
                  rightfist: _fieldKeyR1.currentState?.value,
                  rightopen: _fieldKeyR2.currentState?.value,
                  rightpoint: _fieldKeyR3.currentState?.value,
                  rightvictory: _fieldKeyR4.currentState?.value,
                  rightrocknroll: _fieldKeyR5.currentState?.value,
                  rightgun: _fieldKeyR6.currentState?.value,
                  rightthumbsup: _fieldKeyR7.currentState?.value))
          .then((v) => {returnPage()});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("表情コントローラー"),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    enabled: widget.palletkey == null,
                    key: _fieldKeyName,
                    decoration:
                        const InputDecoration(label: Text("Pallet Title")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyL0,
                    decoration:
                        const InputDecoration(label: Text("Left Idle Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyL1,
                    decoration:
                        const InputDecoration(label: Text("Left Fist Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyL2,
                    decoration:
                        const InputDecoration(label: Text("Left Open Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyL3,
                    decoration:
                        const InputDecoration(label: Text("Left Point Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyL4,
                    decoration:
                        const InputDecoration(label: Text("Left Victory Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyL5,
                    decoration: const InputDecoration(
                        label: Text("Left Rock'n'Roll Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyL6,
                    decoration:
                        const InputDecoration(label: Text("Left Gun Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyL7,
                    decoration: const InputDecoration(
                        label: Text("Left Thumbsup Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyR0,
                    decoration:
                        const InputDecoration(label: Text("Right Idle Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyR1,
                    decoration:
                        const InputDecoration(label: Text("Right Fist Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyR2,
                    decoration:
                        const InputDecoration(label: Text("Right Open Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyR3,
                    decoration:
                        const InputDecoration(label: Text("Right Point Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyR4,
                    decoration: const InputDecoration(
                        label: Text("Right Victory Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyR5,
                    decoration: const InputDecoration(
                        label: Text("Right Rock'n'Roll Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyR6,
                    decoration:
                        const InputDecoration(label: Text("Right Gun Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  TextFormField(
                    key: _fieldKeyR7,
                    decoration: const InputDecoration(
                        label: Text("Right Thumbsup Name")),
                    validator: (v) => v?.isNotEmpty ?? false ? null : "必須項目です",
                  ),
                  FilledButton(onPressed: submit, child: const Text("保存")),
                ],
              ))),
    );
  }
}
