import 'package:flutter/material.dart';
import 'package:osc_facial_controller/screens/controller/controller_screen.dart';
import 'package:osc_facial_controller/screens/pallet_edit/pallet_edit_screen.dart';
import 'package:osc_facial_controller/screens/pallets_select/pallets_select_screen.dart';
import 'package:osc_facial_controller/type/pallet.dart';
import 'package:osc_facial_controller/screens/title/title_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(PalletAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TitleScreen(),
      routes: <String, WidgetBuilder>{
        '/title': (BuildContext context) => const TitleScreen(),
        '/select': (BuildContext context) => const PalletsSelectScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/edit') {
          return MaterialPageRoute(
            builder: (context) => PalletEditScreen(
              palletkey: settings.arguments as String?,
            ),
          );
        }
        if (settings.name == '/controller') {
          return MaterialPageRoute(
            builder: (context) => ControllerScreen(
              palletkey: settings.arguments as String?,
            ),
          );
        }
        return null;
      },
    );
  }
}
