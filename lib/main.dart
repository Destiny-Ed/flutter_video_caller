import 'package:flutter/material.dart';
import 'package:flutter_caller/constant.dart';
import 'package:flutter_caller/screens/home_page.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ZegoExpressEngine.createEngineWithProfile(ZegoEngineProfile(
    appId,
    ZegoScenario.Default,
    appSign: appSignId,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
